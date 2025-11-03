Return-Path: <linux-rtc+bounces-5240-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65261C29F73
	for <lists+linux-rtc@lfdr.de>; Mon, 03 Nov 2025 04:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAC823AF38A
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Nov 2025 03:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4351339B1;
	Mon,  3 Nov 2025 03:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="YWyitl8g"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023123.outbound.protection.outlook.com [52.101.127.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E439460;
	Mon,  3 Nov 2025 03:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762140761; cv=fail; b=pWIOm4/L3UR0n6UjAUYhiA/g9E/K2Wrc89L3OazIgCmLy5E8NnzJp7XohTIuRn6rUnWqy4RpTLNaBuaBLOIl5M7IMSnkdL1qk/fZiUXaOUrsO0yUvPv1xzY9lFqLN50brFeiMQOsxRpt8MrTvkZD3Ljh8BkOi04CF+iQpd24jcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762140761; c=relaxed/simple;
	bh=ij8cXeXiFbxNqWKA5t/myIao0D5OVnkGPlzltlVaDS4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nC3ohqk6KeXlQrvjSa/8FJqRlDjY0Q2wbJLVl0w/fD8PKR+sbzbo/rG2iAA+QALja8LJGcHUQXSYqfvdCTmnlwLomsPcz+tFZqCu3wEGoYM+349YMXFufnEhuwbC3OYuX19pG2Rm6XqQ67CRjz+xBRXF3pyvdD4k4d0iFNQM+MQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=YWyitl8g; arc=fail smtp.client-ip=52.101.127.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCVG4QlddrOpxV9XDEz4aiZltS4157pV/h9zfstTLr0liHzd2RmSqNVlLXq9QG54SeGwuqWfpN7fHc44m9uy8zCs8ZfQhmmPFSoS23voriwfcxhceFJDKlwoXAa8igsrKgT/zX7ikRz/9BADZtn14I/IVS4Hx97c/xHt+tOP5mGstE1kX0sTbHS4jmmHWHjgLomjMJoy8QwZnMSfpMWzIRWHVoM7lWhWiBYD1yAmaqzeIlNgoxqsVOlN+u26csCbslPdZJScktulW0gyvSx+X+wOtxiGqE+S+dpzFErso0k7H9Ths15XuoKOk9f/TqpAbB19krJT87h8tWAo3AxgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zZg8qKmaRMJCdUptNrnit+n+xtlsJinKxuZYZ1AGPc=;
 b=n+hsk+7mI7/5lMezq5qz0aooTWzk+pECylWS4xqQbW+IiJet7vCw35QcIO5fcvJ9ujSXsKslJ8ifXNKzDRv7Uh4q3V5ZQbtZpLcH5Lx4U+I3gv9VGqY1ZgmDTFpoUG6Om+qv1b8OjCcnHpCnj3OTOAxRe4tD7uKBXkzLukqh+33GmYvBY06ftykzNv4SuIMtNi2Oei+RBxtwWeU6hAOXZm4u65+LMxxmkmIh8BYC32LR1aMkErgrk1btJWC/GIYR1mRjzDdO8QBXa4x6V1Yarp4Czq+kgIpFC/Yb46y/DXHkvJ/CGF1Jw2mmylyy80t68uRR+dwYkO/fw/lesLdXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zZg8qKmaRMJCdUptNrnit+n+xtlsJinKxuZYZ1AGPc=;
 b=YWyitl8gF+6+lEcuYssHOqALiucIhOOYFA5Go1IyV0/J0Mpnyx6IqADEGIBTjYUdz7fuWsovqlOofPVv+vGhvntVMorM6sxDyjs7rkdD7JhFx9JNU0KMzRRyxZAO2MRBu0AcJoxDbUpalT7o+1qodoNAnVZzQuUZ6uecJG4/+MTAttwFX/Gfn3yrQVWJRnmusdnu7gOOE++6nj7H+TSOmc3Wbp++Cgk7QdndAqqxQWq6oczeJHwHeSOPtP8Kod/qD9bdu2M1jmTs2cUt2hm2H18exC081725qCU2zJA+foZrbYtdQQtRKHRHdKsr34+qRKB3m/srLdoPL0vSXHEUNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by TYPPR03MB9424.apcprd03.prod.outlook.com (2603:1096:405:318::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 03:32:35 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 03:32:35 +0000
Message-ID: <eef59589-5d52-41d6-a9db-abed2ddf9149@amlogic.com>
Date: Mon, 3 Nov 2025 11:32:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: amlogic-a4: simplify probe
To: alexandre.belloni@bootlin.com, Yiting Deng <yiting.deng@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251031204724.756857-1-alexandre.belloni@bootlin.com>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20251031204724.756857-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0099.apcprd02.prod.outlook.com
 (2603:1096:4:92::15) To PUZPR03MB6888.apcprd03.prod.outlook.com
 (2603:1096:301:100::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|TYPPR03MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c2da0c-4c4e-475e-b702-08de1a89a13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0VsN0YzMGhPUlBQSUorR3BYQlAzUFdlTGF0Zi9SUmhxY1hjNkNXZXNYNFo4?=
 =?utf-8?B?cG1rdUQ4VUZ2QmlhbnBaWnNSZzExckR6RUVydUZNdmM4RjNZbkNEN0JXNHhJ?=
 =?utf-8?B?NGVuVkFkQ3pKOVpFUW4wc25jNFU0RGZZRytwL29UTlZtNThKakVwaWxIUkJX?=
 =?utf-8?B?Q1BDRWU3UXhIcTlpeDNpbW9UUTVYOGs1d0ZXME0vSmlROUtIM3Jqbk5uVk5w?=
 =?utf-8?B?bzk2OXhiaXVuUFlOd2hYV3dDUWdMRlRxMElUT1FZRnlmNjljNUc3VDNBU1Jz?=
 =?utf-8?B?V0t2elh2bVFrcEIvQ3BORDdCYXZxUzNremw3WEllZUpGdkkvRmFXWGh3bjRZ?=
 =?utf-8?B?Qkl4Tnlra2trUXEzeVBWaG5CdXFNV1dPWHU0UVI0MTZDVUNVZEpUVTVYYUI1?=
 =?utf-8?B?dGpPMmFlaHhDZ3ZFUVhLVXVLTEtlTVdxRGdkUm4zMEFnN2xzSUJ2NGVOUldN?=
 =?utf-8?B?VzNpcGozMXg4Uk96YUVhTUQvYUZPdEhrdUtQQjFZYmgzRkFiWHJIRitZZHNo?=
 =?utf-8?B?RWRra1dMQXlRM20wMkJ1c0YzRjJObGVNRGVteFpwWW5mV3dJdm1PYnd6MTRQ?=
 =?utf-8?B?d3pqTGQzbzg5ZlkxYzJ5bk42YXhSbE5QdEMwbUJwWHlwdlFQTEtaczdtbUVo?=
 =?utf-8?B?RzFHb1FSWko3YjF3L3c5MkFTOHVlZGswMGdpTDdLZmsrVTFVaHpTMTJzdGRz?=
 =?utf-8?B?NDkwdTQ0eUpvM2ovTFJPcnNRdnBwZ0I0VWxnVkpzSUVsOVAwSVRsL2lzY29w?=
 =?utf-8?B?dER5SnczM3JoMEFFNGNVa0ZjRzNrZjRXQzFFdkRURTRoTXBIOG1vUmR4R01x?=
 =?utf-8?B?QmVob0h2VG1mWkNFb2d5cWFpQlJFN25LcnFXeDVGcm5ES0gyNXFqbVRaYmdq?=
 =?utf-8?B?TUkydTVmMWhWY2FETGMybitJNTBKdVNPSDV1Z0p2TUJjMk1PL25EeUF5dXN2?=
 =?utf-8?B?eTVkWGNJREpiZmZrbDY1YXlaZHcraWx5U2p4R0pISE9wU0FrbDYzQkxVT2Yr?=
 =?utf-8?B?V2VrWDhrR2xwY3R0T3RjNTZnb3QrRUtYNDB6elJNUXRSV2c1Vlk3dUF2WUhS?=
 =?utf-8?B?SmFpVklScXVmaVNCRSs0ZTU1Q1NhSGFPYWpqdm43NjlyS0NYMmhLRE9QZkhE?=
 =?utf-8?B?NGFiaG8rTGo5ME5ITHptYlBuN3IwMVQxTllMOHM1Z3REQVZBbFRkV2xyTkZQ?=
 =?utf-8?B?K0o2TDFqa1RUNXR6UG9nTlVuN0lTalJIZGl5L09ra0JsY1ZQbmFZWXhvUzBT?=
 =?utf-8?B?NEw4ZmVIcXpJUjg0SHBkRVZtemlRcmwyVlU1K2RtZ2RHcHdWeGtYVDZpcFVP?=
 =?utf-8?B?aVJJYWt2TFNXMG1yaVpBSmNhMjR6U0V5WTFNcWd4ZCtZaW1nZkxSTTErSFVj?=
 =?utf-8?B?aG1WMlRxTG1RcklyUEFMUmxka2JJUUdoMkd2Qkp5T1VlczA5ZCtlTHN3WnlG?=
 =?utf-8?B?djV5Ymo2SDRpZkkzbnVjbCtNWUMweGE4ZzdRZllUaGJQZElQM1N3ZitVL1Yv?=
 =?utf-8?B?L2tRdzBNenFPTjNWQkV6SDg0bjhWeFBIOERjRjdiKzIvZ2VBblUzcklCTGx5?=
 =?utf-8?B?R2V5d0lDMGswRVpKS0MvcC81bldVWTl0UncvMSs2djhTa3pCMnlicHk0RjdY?=
 =?utf-8?B?eVVqZWhWemdhUzArdXNQTFVFMmI1YktoK29WN20xQXJ2OW5oWGY1L3JjY3BF?=
 =?utf-8?B?RlpBYWtSc204Wm9WeEFXY0kzcHhZUUE4akxXUm9uNU5rdG4xN1ZVajlhQzJJ?=
 =?utf-8?B?VVJxa1l5bXZuNlljZXdxMjFmYUZFK1ZDdTRqaE5ySTVicFpQRnZUUzZ1TXAv?=
 =?utf-8?B?TGR5UWRFczlleGF2dUJLQ0lvUUMzekZqQTl6dEVLdm5ZQW05elNGTXRFWWY3?=
 =?utf-8?B?YXhsMFhCR3lTZkYvcWVIczkrMExjZm9lRmVYQUFqb3UwdWdDYzlzNEMrcUpJ?=
 =?utf-8?Q?iV4NlOjkhPbfrdfSjs1fn++Caz0Pucuw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vno2YWEyWnNzUkRjWXZuNDdGd3VIWjZNSnphS1BtTGpzcnBYMGk0TGhoUkhZ?=
 =?utf-8?B?M3ZnL2tMREwyZ1hDeDZwUEFYaVNVcEZJVFY4bFE3VVhNZE0yQ0dHMGFzRyty?=
 =?utf-8?B?UHovR2Nyck80a3hFNytnVTBCMklJbitaYUMvclNqWUR5aWZ3ZFpGbUdIeVBp?=
 =?utf-8?B?S3lwSXhjK21mVHR6aGQ1YnNIaEhyTGRmNGw5RGJKUDVWZWs5cFYrdHh5NERt?=
 =?utf-8?B?cXR1R08vSlpLZW1aVS95OXp0WGJ0QXRrRDh4UmFja29nSzI2WUpzR000aTVz?=
 =?utf-8?B?dDVOSDhldzBCVllwbUtjZWUvQkEvbFFjOHdRL2RJVkVaVEhSdjNNTGt3dHJL?=
 =?utf-8?B?aFV6TysrZE5ub0NTQVlWdXFxd3JadXlVSDlTMmJUb2lON1ZnRGFIS3RRR01w?=
 =?utf-8?B?Vzc4cEZrVWowVmg4cWlMckdZb2ZKWXlhZHdUbDU3cnA5UW1RY1dvMXdwY3dU?=
 =?utf-8?B?YUJOSENxV1ZmbTlKaWwweXJFaVV5NjVka3FDenI0VUVTb0MvbGpPTVJuMWp2?=
 =?utf-8?B?cGxib1NyOEdyN1ZlKzlBby91c3dIYTZ6M3l6b0IvaUlzUVlNc0hGRlpRejVN?=
 =?utf-8?B?NVVoT0NXY3lEa1hTSzlFZ1BTSWZTNkxXRzFYcUpWUDQyc3hUU2hucWVRZCtK?=
 =?utf-8?B?TkZNbG95cSs1VTNqUlpNYXFLQW9KZnRpMWJlUEZkdVg5YXBJVWQ1TXpObngv?=
 =?utf-8?B?cVlEdjBmeGxkeVBOZXRDV2RyQ2grVDduMXVvaExrTk5VUzd4akFzQ2FnUUZo?=
 =?utf-8?B?K081RGZvajRLbFdzTVZZSWI0WEovb2NwNTJpSGRwOVdjbHQxWEE4MnpIUGlO?=
 =?utf-8?B?RG9FYmJlYjVUK1Fabi9RUHd3bWlLRTAxT21NSnV6MUZ3aXlhQlE4NlRZYzZt?=
 =?utf-8?B?UjE5ZlpMaWVLdnVSOEs3NmtqU0cwWUJiU0hjWjNBZmpGc25heFY4WWxWMUZT?=
 =?utf-8?B?R3o1U05SRFpPR3BhUUl2OFdraGR5eThYVG93ZktnQ2tZY0JrR0xiSlU2cFVU?=
 =?utf-8?B?YlNvOFJPaVJKTlpoNWZmbXIzL1k2aFlaQVN4Y2h4djRKbms5SkhwQTAwaXlz?=
 =?utf-8?B?YjB5K1dZSE85QVE0clI3ZmVRR3pqaisxU2d1TTNOR2duWmFkTU1yNitVRnhB?=
 =?utf-8?B?RmFEUHo2ZnlDVklmNk5uNDNkRFhSS01ZSDVTYlc1Yzl3SHFON3RncVYydXVY?=
 =?utf-8?B?ZDY2dVpkaThtR0txbklmdUhvQUt4amxvWDI5K1N5OUV0b2tkc3RUOE90N0Zw?=
 =?utf-8?B?Ryt1S2dibzZ2a0J0bGFJcTlnU0d1K0FJcjJ4N28rbGprNThxRU55K0VjR3NJ?=
 =?utf-8?B?cHF2VEoxWFJGeUtSblMyeWVqNFRVaktlazg2Wkw0OE0rZ1B5ZjdLcnc2dlpo?=
 =?utf-8?B?eFVWcDQ1K0hYbXRlUXBsTDFTZEVMS0RkWHB6bUhqWDU4ZFdYNXdpcm83Uy9r?=
 =?utf-8?B?ZWRCb1Q1WEdxSDNXeEQvYzNISGhzc001Q2lRQXFYYW9xNFFVZlBNaklyTzQ1?=
 =?utf-8?B?bzd6MTFWRzRGWVpCRlprcXRqL1hzZlA2RmNjWWQ2ZkJ1UG5vTkdvemcxazY4?=
 =?utf-8?B?dk1mK0VYSEhReTJUU0FJYU1OSys3b0pxWGFXTll6WGpsQXQwYjRqK3YrZVZD?=
 =?utf-8?B?SmdyTjYzdnRyTDNHdjYvaWRxejBEdFRvcHJjRXJKTHJmOHVUcjgvWDNhZjdv?=
 =?utf-8?B?L2dKbWsxTTdxdUdKRjd1aTc3Z29vcG9lWm5ESG9XSzFQQ0F0bCtEaTlMclJx?=
 =?utf-8?B?NWo2ajdsRTFmTm9rNHBOM2Z5ZmRBSDFkdTJVb0N2RzFDNW9Rb0JWck45dUM5?=
 =?utf-8?B?b3QyRU40bVk0UUx1NUlzSDlyc1NRSkcwbDVMT0pmNzJBRTVMTUZWdVFPQjZX?=
 =?utf-8?B?ZlVFK3FpL01yNGxrOVNyTjlDL2tJOWhBTlNaSnBXaGpTMFpWeTNuTzVwZnUv?=
 =?utf-8?B?VWx3QXVWWnBUMzNUeXRweGo5V3VsdWI2K2FpT0ovLy9SdWVIU1dHa1M4QnpE?=
 =?utf-8?B?TlY1Uzh3S1hWN0lKRm5FMHIrMHZhZGo2eWhud2lZRmdscDI5djJZb2Y5TXVB?=
 =?utf-8?B?WUhQYzUrQjlibG9QUDZvT0tvRUtnU2dmOW5wdE9lc1hYb0JVajYvczc0UXRT?=
 =?utf-8?B?MmhVV2FLU1ZmUldKS09Ua3JUZDQ1UkhtNE5Vd3NOZ1ZkK3ZOOWpSSkJST2lP?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c2da0c-4c4e-475e-b702-08de1a89a13e
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 03:32:35.4235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZq4mHocXoVsKpXbiRGjW7s68o1pY7VhQBi6FxqEgN2zlVnFuGIijeWAbtP4FcvtQ1GFmMv+kkf49Eeu8BhMSogu6VQe3xRJc3jogYIjdGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9424


Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
On 2025/11/1 04:47, alexandre.belloni@bootlin.com wrote:
> [ EXTERNAL EMAIL ]
> 
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Use devm_device_init_wakeup to simplify probe and remove .remove as it is now
> empty.
> 
> Also remove the unnecessary error string as there are no error path without an
> error message in devm_rtc_register_device.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>   drivers/rtc/rtc-amlogic-a4.c | 28 +++++-----------------------
>   1 file changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
> index a993d35e1d6b..123fb372fc9f 100644
> --- a/drivers/rtc/rtc-amlogic-a4.c
> +++ b/drivers/rtc/rtc-amlogic-a4.c
> @@ -361,38 +361,26 @@ static int aml_rtc_probe(struct platform_device *pdev)
>                                       "failed to get_enable rtc sys clk\n");
>          aml_rtc_init(rtc);
> 
> -       device_init_wakeup(dev, true);
> +       devm_device_init_wakeup(dev);
>          platform_set_drvdata(pdev, rtc);
> 
>          rtc->rtc_dev = devm_rtc_allocate_device(dev);
> -       if (IS_ERR(rtc->rtc_dev)) {
> -               ret = PTR_ERR(rtc->rtc_dev);
> -               goto err_clk;
> -       }
> +       if (IS_ERR(rtc->rtc_dev))
> +               return PTR_ERR(rtc->rtc_dev);
> 
>          ret = devm_request_irq(dev, rtc->irq, aml_rtc_handler,
>                                 IRQF_ONESHOT, "aml-rtc alarm", rtc);
>          if (ret) {
>                  dev_err_probe(dev, ret, "IRQ%d request failed, ret = %d\n",
>                                rtc->irq, ret);
> -               goto err_clk;
> +               return ret;
>          }
> 
>          rtc->rtc_dev->ops = &aml_rtc_ops;
>          rtc->rtc_dev->range_min = 0;
>          rtc->rtc_dev->range_max = U32_MAX;
> 
> -       ret = devm_rtc_register_device(rtc->rtc_dev);
> -       if (ret) {
> -               dev_err_probe(&pdev->dev, ret, "Failed to register RTC device: %d\n", ret);
> -               goto err_clk;
> -       }
> -
> -       return 0;
> -err_clk:
> -       device_init_wakeup(dev, false);
> -
> -       return ret;
> +       return devm_rtc_register_device(rtc->rtc_dev);
>   }
> 
>   #ifdef CONFIG_PM_SLEEP
> @@ -420,11 +408,6 @@ static int aml_rtc_resume(struct device *dev)
>   static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
>                           aml_rtc_suspend, aml_rtc_resume);
> 
> -static void aml_rtc_remove(struct platform_device *pdev)
> -{
> -       device_init_wakeup(&pdev->dev, false);
> -}
> -
>   static const struct aml_rtc_config a5_rtc_config = {
>   };
> 
> @@ -447,7 +430,6 @@ MODULE_DEVICE_TABLE(of, aml_rtc_device_id);
> 
>   static struct platform_driver aml_rtc_driver = {
>          .probe = aml_rtc_probe,
> -       .remove = aml_rtc_remove,
>          .driver = {
>                  .name = "aml-rtc",
>                  .pm = &aml_rtc_pm_ops,
> --
> 2.51.1
> 

