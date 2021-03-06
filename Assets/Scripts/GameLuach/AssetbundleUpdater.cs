﻿using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using AssetBundles;
using XLua;

/// <summary>
/// added by wsh @ 2017.12.29
/// 功能：Assetbundle更新器
/// </summary>

[Hotfix]
[LuaCallCSharp]
public class AssetbundleUpdater : MonoBehaviour
{
    const int MAX_DOWNLOAD_NUM = 5;
    Text statusText;
    Slider slider;

    bool isDownloading = false;
    bool hasError = false;
    Manifest localManifest = null;
    Manifest hostManifest = null;
    List <string> needDownloadList = new List<string>();
    List<ResourceWebRequester> downloadingRequest = new List<ResourceWebRequester>();

    int totalDownloadCount = 0;
    int finishedDownloadCount = 0;

#if UNITY_EDITOR || CLIENT_DEBUG
#if !CLIENT_DEBUG
        [BlackList]
#endif
    // Hotfix测试---用于测试热更模块的热修复
    public void TestHotfix()
    {
        Logger.Log("********** AssetbundleUpdater : Call TestHotfix in cs...");
    }
#endif

    void Start () {
        statusText = transform.Find("ContentRoot/LoadingDesc").GetComponent<Text>(); ;
        slider = transform.Find("ContentRoot/SliderBar").GetComponent<Slider>();
        slider.gameObject.SetActive(false);
        StartCoroutine(CheckUpdate());
#if UNITY_EDITOR || CLIENT_DEBUG
        TestHotfix();
#endif
    }

    IEnumerator CheckUpdate()
    {
#if UNITY_EDITOR
        if (AssetBundleConfig.IsEditorMode)
        {
            yield return StartGame();
            yield break;
        }
#if UNITY_5_5
        // 说明：亲测在Unity5.5版本本地服务器根本无法连接，倒是在手机上正常
        Logger.Log("No support simulate in Unity5.5 in windows...");
        yield return StartGame();
        yield break;
#endif
#endif

        statusText.text = "正在检测资源更新...";
        yield return CheckIfNeededUpdate();
        // Unity有个Bug会给空的名字，不记得在哪个版本修复了，这里强行过滤下
        for (int i = needDownloadList.Count - 1; i >= 0; i--)
        {
            if (string.IsNullOrEmpty(needDownloadList[i]))
            {
                needDownloadList.RemoveAt(i);
            }
        }
        if (needDownloadList.Count <= 0)
        {
            Logger.Log("No resources to update...");
            yield return StartGame();
            yield break;
        }

        // TODO：下载资源确认弹窗
        statusText.text = "正在更新资源...";
        slider.normalizedValue = 0f;
        slider.gameObject.SetActive(true);
        totalDownloadCount = needDownloadList.Count;
        finishedDownloadCount = 0;
        Logger.Log(totalDownloadCount + " resources to update...");
        yield return StartUpdate();

        statusText.text = "资源更新完成！";
        slider.normalizedValue = 1.0f;
        Logger.Log("Update finished...");
        yield return UpdateFinish();
        yield return StartGame();
        yield break;
    }

    IEnumerator GetDownloaderUrl()
    {
        var url = string.Empty;
#pragma warning disable 0162
        if (AssetBundleConfig.isDebug)
        {
            var request = AssetBundleManager.Instance.RequestFileAssetAsync(AssetBundleConfig.AssetBundleServerUrlFileName);
            yield return request;
            url = request.text + AssetBundleUtility.GetCurPlatformName() + "/";
            AssetBundleManager.Instance.DownloadUrl = url;
            request.Dispose();
        }
        else
        {
            // TODO：外网服务器下载url看到时候要不要从服务器拉取
            url = AssetBundleConfig.RemoteServerUrl;
        }
#pragma warning disable 0162
        Logger.Log("downloadUrl : " + url);
        yield break;
    }

    IEnumerator CheckIfNeededUpdate()
    {
        yield return GetDownloaderUrl();
        localManifest = AssetBundleManager.Instance.curManifest;
        hostManifest = new Manifest();
        var request = AssetBundleManager.Instance.DownloadAssetAsync(hostManifest.AssetbundleName);
        yield return request;
        if (!string.IsNullOrEmpty(request.error))
        {
            // TODO：错误弹窗
            Logger.LogError("Download host manifest :  " + request.assetbundleName + "\n from url : " + request.url + "\n err : " + request.error);
            request.Dispose();
            yield break;
        }
        var assetbundle = request.assetbundle;
        hostManifest.LoadFromAssetbundle(assetbundle);
        hostManifest.SaveBytes(request.bytes);
        assetbundle.Unload(false);
        request.Dispose();

        needDownloadList = localManifest.CompareTo(hostManifest);
        yield break;
    }

    IEnumerator StartUpdate()
    {
        downloadingRequest.Clear();
        isDownloading = true;
        hasError = false;
        yield return new WaitUntil(()=>
        {
            return isDownloading == false;
        });
        if (needDownloadList.Count > 0)
        {
            // TODO：继续更新确认弹窗
            statusText.text = "资源更新发生错误！";
            yield return StartUpdate();
        }
        yield break;
    }

    IEnumerator UpdateFinish()
    {
        hostManifest.SaveToDiskCahce();

        // 说明：有资源更新时必须重启一下相关模块
        // 重启资源管理器
        yield return AssetBundleManager.Instance.Cleanup();
        yield return AssetBundleManager.Instance.Initialize();

        // 重启Lua虚拟机
        string luaAssetbundleName = XLuaManager.Instance.AssetbundleName;
        AssetBundleManager.Instance.SetAssetBundleResident(luaAssetbundleName, true);
        var abloader = AssetBundleManager.Instance.LoadAssetBundleAsync(luaAssetbundleName);
        yield return abloader;
        abloader.Dispose();
        XLuaManager.Instance.Restart();
        XLuaManager.Instance.StartHotfix();
        yield break;
    }

    IEnumerator StartGame()
    {
#if UNITY_EDITOR || CLIENT_DEBUG
        AssetBundleManager.Instance.TestHotfix();
#endif
        // TODO：根据公共包自动设置常驻包
        string loadingAssetbundleName = "assetspackage/ui/prefabs/view/uiloading_prefab.assetbundle";
        AssetBundleManager.Instance.SetAssetBundleResident("assetspackage/ui/fonts/system_ttf.assetbundle", true);
        AssetBundleManager.Instance.SetAssetBundleResident("assetspackage/ui/fonts/system_art_ttf.assetbundle", true);
        AssetBundleManager.Instance.SetAssetBundleResident("assetspackage/ui/genaltas/atlas_comm.assetbundle", true);
        AssetBundleManager.Instance.SetAssetBundleResident("assetspackage/ui/genaltas/atlas_role.assetbundle", true);
        AssetBundleManager.Instance.SetAssetBundleResident("assetspackage/shaders.assetbundle", true);
        AssetBundleManager.Instance.SetAssetBundleResident(loadingAssetbundleName, true);
        var loader = AssetBundleManager.Instance.LoadAssetBundleAsync(loadingAssetbundleName);
        yield return loader;
        loader.Dispose();
        XLuaManager.Instance.StartGame();
        Destroy(gameObject);
        yield break;
    }
	
	void Update () {
        if (!isDownloading)
        {
            return;
        }

        for (int i = downloadingRequest.Count - 1; i >= 0; i--)
        {
            var request = downloadingRequest[i];
            if (request.isDone)
            {
                if (!string.IsNullOrEmpty(request.error))
                {
                    Logger.LogError("Error when downloading file : " + request.assetbundleName + "\n from url : " + request.url + "\n err : " + request.error);
                    hasError = true;
                    needDownloadList.Add(request.assetbundleName);
                }
                else
                {
                    // TODO：更新下载流量
                    Logger.Log("Finish downloading file : " + request.assetbundleName + "\n from url : " + request.url);
                    downloadingRequest.RemoveAt(i);
                    finishedDownloadCount++;
                    var filePath = AssetBundleUtility.GetPlatformPersistentDataPath(request.assetbundleName);
                    GameUtility.SafeWriteAllBytes(filePath, request.bytes);
                }
                request.Dispose();
            }
        }

        if (!hasError)
        {
            while (downloadingRequest.Count < MAX_DOWNLOAD_NUM && needDownloadList.Count > 0)
            {
                var fileName = needDownloadList[needDownloadList.Count - 1];
                needDownloadList.RemoveAt(needDownloadList.Count - 1);
                var request = AssetBundleManager.Instance.DownloadAssetAsync(fileName);
                downloadingRequest.Add(request);
            }
        }

        if (downloadingRequest.Count == 0)
        {
            isDownloading = false;
        }
        float progressSlice = 1.0f / totalDownloadCount;
        float progressValue = finishedDownloadCount * progressSlice;
        for (int i = 0; i < downloadingRequest.Count; i++)
        {
            progressValue += progressSlice * downloadingRequest[i].progress;
        }
        slider.value = progressValue;
    }
}
