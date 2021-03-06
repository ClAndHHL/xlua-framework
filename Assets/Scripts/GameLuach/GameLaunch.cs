﻿using UnityEngine;
using System.Collections;
using AssetBundles;
using UnityEngine.UI;

public class GameLaunch : MonoBehaviour
{
    const string luachPrefabPath = "UI/Prefabs/View/UILuanch.prefab";

    IEnumerator Start ()
    {
        // 启动资源管理模块
        int frameCount = Time.frameCount;
        yield return AssetBundleManager.Instance.Initialize();
        Logger.Log("AssetBundleManager Initialized, use frameCount = " + (Time.frameCount -frameCount));
        frameCount = Time.frameCount;

        // 启动xlua热修复模块
        XLuaManager.Instance.Startup();
        string luaAssetbundleName = XLuaManager.Instance.AssetbundleName;
        AssetBundleManager.Instance.SetAssetBundleResident(luaAssetbundleName, true);
        var abloader = AssetBundleManager.Instance.LoadAssetBundleAsync(luaAssetbundleName);
        yield return abloader;
        abloader.Dispose();
        XLuaManager.Instance.OnInit();
        XLuaManager.Instance.StartHotfix();

        // 加载UI界面
        var loader = AssetBundleManager.Instance.LoadAssetAsync(luachPrefabPath, typeof(GameObject));
        yield return loader;
        Logger.Log("Open luanch window, use frameCount :" + (Time.frameCount - frameCount));
        var prefab = loader.asset as GameObject;
        loader.Dispose();
        if (prefab != null)
        {
            GameObject go = GameObject.Instantiate(prefab);
            InitAssetbundleUpdater(go);
        }
        else
        {
            Logger.LogError("LoadAssetAsync luachPrefabPath err : " + luachPrefabPath);
        }

        yield break;
	}

    void InitAssetbundleUpdater(GameObject go)
    {
        var luanchLayer = GameObject.Find("UIRoot/LuanchLayer");
        go.transform.SetParent(luanchLayer.transform);
        var rectTransform = go.GetComponent<RectTransform>();
        rectTransform.offsetMax = Vector2.zero;
        rectTransform.offsetMin = Vector2.zero;
        rectTransform.localScale = Vector3.one;
        rectTransform.localPosition = Vector3.zero;

        go.AddComponent<AssetbundleUpdater>();
    }
}
