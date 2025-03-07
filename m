Return-Path: <linux-rtc+bounces-3421-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4435A55BB0
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Mar 2025 01:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92C1C3A574D
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Mar 2025 00:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56842139B;
	Fri,  7 Mar 2025 00:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ixezM8b5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vfGWCHOd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C3E611E
	for <linux-rtc@vger.kernel.org>; Fri,  7 Mar 2025 00:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741306681; cv=fail; b=XCYimwvzN/UTTC1ufZPsMh5GVe+NwlIsNNGOH8/DelmEHjz3wH8UrcibwVoZyblzBSbfT6m8FiPhsxtwxnsQgEmRgp6l90dLsslU4noqwhP85x44WnTO5XLE7wnas3AgIpidLJYyx5oO5rSAUy+ngqS8+gWq0dFNjefXdVJ3RPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741306681; c=relaxed/simple;
	bh=IHXcp1vMYQYxYAXnUMTpLaJli99nPu16MK6MounEy0Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YZVaPzRz3qAM+4l2oAJlQvrdi3QJl/ugeDOgbCmgvKEqu8r9OUJGrDehrwT4YXWxfrsemyqXj/H2dwfNXJ5KCak6+8Fcpnuyt6aQUXPyHdHO4KUXHVKATJQfa0Fa2ix1Q0OUjS3W6MSpWzl4oHCsMGA3zE6seLahKVJKU5KqDx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ixezM8b5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vfGWCHOd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526LBj4h003048;
	Fri, 7 Mar 2025 00:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=tGeProVjHuaGtZioajBNMAw/xu2C6KRhk7TOKH3IsJ0=; b=
	ixezM8b5sKXwIDmWe+7DHRTpvVv0loG1WnKz/fbo5bseoX/H5O4JNEwjgd8XSEDX
	G6l40q1TqGBX5l3p/TWX66mRpbI/JuOUMHW9am7anlh+/6obyWp6aD91MNHsnlDE
	vscsdZyCnkvi6oLTw4dWneB/4Wy5afNmLPsqo8sA6Kx1zIU/g6j7XlS2O2Arxabb
	ThNmYRG9DK/Rt5AugLqKMsoxCgp6YwuQkjqJej6gPIc1xNltbDz1fqy88lswgRUx
	HN6Ii01697v4lRX5ol0u0zG0pJoykCNyv2juc8lBrQm8a7nOFHkQTav/FR3Id1RA
	CnbyOcl+0i+yxln2A0rYDQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u86u7a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Mar 2025 00:17:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 526NGjTa012023;
	Fri, 7 Mar 2025 00:17:53 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 453rpefy85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Mar 2025 00:17:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfRzEoAnyvWngrWgyzGNjcrx0C+BOGjy7knPxYfw3rx6v1sIUepNP1GvsjbSl+WVokHYgohq3DmLEzooB0mzsnLa9H7PAlMrJkTqqRUAllBRk79vmoeH410+VFYOOlU25ERGcV+w9OovVF/dB13gTV55h/2fJtp7MDIDcygslWpKWf8sjheBUpcsAscxJkwCJxD7lazd3ZqwjQHq5x8DquExfEgnV+XAD8auGIQ3Ky3kl91wgUT6WmfHsO+yJNeS9d13D1FQAtfh4BSn4R+l5v4AhE9LIbit+GvbTskCCJ8eimhJHcv29zz5bfAQ6EtG26Ty+zqoDD9grmOOCZigAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGeProVjHuaGtZioajBNMAw/xu2C6KRhk7TOKH3IsJ0=;
 b=MFb7md5+CB35oSAszX+kKxNZ77KRwlFfCMyRXhpDOHwMY3Gv4fnDXJ3lZrLE/qlNYUsCB4Pvymvi9Y/5U6OugMjuoFYmsedE50Sn5aezApsD7trVF3p4n3bVe1bpWDTnBSYPC1Y+eRfvNWG/e+Abb9fCvO5mmWxd77/IQI4OnWqLpC2nhEF3h/B+RtEEvOAR02vRhojXio+jxAI7J1ZFPVKW2oGeO0nAVbXLrfNnGGmKPNocLJKOj05MKcmihWft+1ZIUOqkHEvFkj5Cqxp9zgMxq/1jYTLjIXLX/inCqT2ihgbk/W4Fq7I0DyU71szkW9y7tqCRhZW/ScL5uCiAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGeProVjHuaGtZioajBNMAw/xu2C6KRhk7TOKH3IsJ0=;
 b=vfGWCHOdO4zmmzm7xrT8cpYGuck8cK3A0dE49AJ+/q+RLwjBOUw04VlIzgyGu9PyePUAWDnEbHBZBCdhOfZ0QWRRSMCB3wEBGUDsm3/efFQyErbicIaCtlsOoZ1nVIE2HFR/8H4+Obk2mRm7zY+db+b7prHpeKlc6Gjn0AMStwQ=
Received: from CY8PR10MB6707.namprd10.prod.outlook.com (2603:10b6:930:93::22)
 by CO1PR10MB4449.namprd10.prod.outlook.com (2603:10b6:303:9d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 00:17:50 +0000
Received: from CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::ccf3:1df:e15d:7465]) by CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::ccf3:1df:e15d:7465%6]) with mapi id 15.20.8489.025; Fri, 7 Mar 2025
 00:17:50 +0000
Message-ID: <19e6873f-3cba-49e7-bc1b-544bffe5eb71@oracle.com>
Date: Thu, 6 Mar 2025 16:17:47 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: LTP rtc01 RTC alarm test fails
To: Mario Limonciello <mario.limonciello@amd.com>, rafael.j.wysocki@intel.com,
        alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org
References: <dc4c018c-77f0-4cd1-81c8-929f40e6162f@oracle.com>
 <759f4d7e-de8a-4d04-a6b4-e138c02167f9@amd.com>
 <75a1d5d2-8ec7-4496-8c24-2815bb6414e5@oracle.com>
 <b66f43d9-7e98-408b-9123-6689d48a642d@amd.com>
Content-Language: en-US
From: samasth.norway.ananda@oracle.com
In-Reply-To: <b66f43d9-7e98-408b-9123-6689d48a642d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR01CA0037.prod.exchangelabs.com (2603:10b6:208:23f::6)
 To CY8PR10MB6707.namprd10.prod.outlook.com (2603:10b6:930:93::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR10MB6707:EE_|CO1PR10MB4449:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf6807c-07f7-466f-9816-08dd5d0d7eea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlFqQWtQeGFEZVZaK29JTEttcXprRDZXeW9TMDAyM2x0Y01QTVoveldaVGFz?=
 =?utf-8?B?QmxxNjQ0UnZ4T1VIYXRuRU1nSzE0MXB5TERkcmFkYzlJUE5vOGsxZUU2NmlL?=
 =?utf-8?B?MjNMaHpGNlBFeUlldlhDZ2V2cmtWZkJyeDhRTTcwYXM1NzkrLzdxVlJaK0Mw?=
 =?utf-8?B?aTNPQThLTmJuRU10Y2VGL1g0NW1FVy9XT29TSCttTjF4VnZOejZ6VDBobGxQ?=
 =?utf-8?B?dmJxSHBxNElkUXlkQlJsUUN2OGovQUY5TjErbnV0aVM2UVNrdTlnc1p5amRW?=
 =?utf-8?B?N2hueGtONi9rQnhPR3FMbW9UbG5JbFZVeXJ3bmhsNk9WakNtQWhyZHQwbTE4?=
 =?utf-8?B?M1VtMjlpYTZUVFFEaURGNHh1MnlCNndEK3pETDVPdzRnN2MxVWwzNUdtekh0?=
 =?utf-8?B?WVVXWTdTUE15aUlWQmd6RHVQa2FOMmVEWjdjU1htMHp6ZlFNUUlhS0kyMmlu?=
 =?utf-8?B?cVBDYVVibmNPTEpMY2xwOXErRDAyd0Jpc2g0dzlxZWY1eks5a3U1QlpkYlVu?=
 =?utf-8?B?NVU2a2t1TTdQUVdVNmEzSDJIcDBWdUVhTHgxWHhtR0lkd3JZZ1dJcmdoUU94?=
 =?utf-8?B?WE85L3Nab05jK3czTlp1OEVGUHNMNkZwSkg4UzhGYlNicjVJYXd6QS9sNXdG?=
 =?utf-8?B?aktxMjBoV0JnSys4dVhDMmlVOGUxaUFRSEtFM1FnamRlSlpoeVNveU5qcGFL?=
 =?utf-8?B?cU5xME9QeWZoWFdMWURHU29GTlpidjMzcDZCQUFHdlZnVDVMSDBTQVNja0kx?=
 =?utf-8?B?SEZEZmQzUy9qMGI1eFMvdC8zS3NvdFRoYlVSdXpjR1dOeXU5Sm4rWkRxTVRK?=
 =?utf-8?B?bVVjWHM5NTA5OFJKR1RHRUNFeUtJN29iRWpFMVlsV2E0djQ5VHBPU2pnUHJn?=
 =?utf-8?B?VDlreTUyRk85c1liOGx0ZzVYZEhSQnFRNmJCbG5oQWc4NmJxU05SZ0pIdkc1?=
 =?utf-8?B?TDZGZ3JBRHJrWVJ0ZGE5N2R0V2tCdkhXcVdXYWI5ZGZMNUMxUHZEZDFUT3hT?=
 =?utf-8?B?UzBjYTB3M2V0NU90c3JSRE5lZEV2cTFjN0s3Z2QyWDYxQ29VUzJWcXYzTDl6?=
 =?utf-8?B?bzBZTHJWVWp6NFFlSG40QUw3cDFFYzBKRktXN1hqVURQbzlZUXg2WXlwcWhq?=
 =?utf-8?B?MG1aNlhDcFRhNzFLampFc1p4SVNERXFxbGNQRHpaSU9SRk9Vam9XTzhPSlhZ?=
 =?utf-8?B?RnlWMFgvazI5Qlp4MVk4bk1EaE14WHBCV1dwK1U0b3hWQkNaZkpnbFBsTXdF?=
 =?utf-8?B?V2VNNUZPZlUxYVpWOHhnbVlSS2trM3RxZzdaOFV2WERnWEJLZjArcUJ3cDB5?=
 =?utf-8?B?WmdmY2dMTDc0aG5KMTdaN29nbzlSZXNReWNxaGRRaVA0R3VRa3ZjU05udlpq?=
 =?utf-8?B?S1pVSlFjK1VjZEhBV1hBcDdTUXFWVnlOaGF6Um9YQnRFYzE3TkFnU2p6VW1D?=
 =?utf-8?B?SWY4aHFNbGkzRkFpTzhLUDcya3FCaGhiTHlmZStZRmtFTDJNaFhLRjhYRFBZ?=
 =?utf-8?B?TnIralhQclRsOEQ3SjdlSFRlU0F3ZXhsYjdUU01LdHJPRWUwdlExRzFnYjdX?=
 =?utf-8?B?L25tTHJDaWwyelhFdjdWaUYxSXNhU3ExZ1lsTUthbDBxQjFQcmlNQUI0Tkdh?=
 =?utf-8?B?amZxWVJoQi9mWVd0U0p1NGVxVXZEbWpTTVd3NGJmTlRjYXNOaDRCV3RERTFk?=
 =?utf-8?B?UFo1RG5xK3VGNEV2WDgzeU9BeGNVZWgxQ2RXYVdaUGNZTmYxZmxrRlphRG1s?=
 =?utf-8?Q?8UbOCA9aFDqPtN6mi4IyApbBhuJHRX0dZkOSDQH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6707.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjZUbmdZeUcxNHNPNUg5NzRrSmFuZzMwNjEyZ1Q3aGoxd0JTc3RaUXdzNmdY?=
 =?utf-8?B?OHl4cm5BakVzOThzOEV3U1pHSHdGSmo0WUs1bExJRXNJZGQzVWdKVWpsaG1v?=
 =?utf-8?B?N0ZLK0JjMFFVd1RJM3p4QmZGUVU0UWd1elZPTU52dFQwR0hMcXFPOWFEb1NY?=
 =?utf-8?B?VWpPVUlOU3oyZ21YNnlxSFQzZ3kyR1dHQVdVVlV6eE1PZVlTTlQrTFlNL2E2?=
 =?utf-8?B?M0h2UGp3U2U1VnhhSVVweURDa1ZjczRmdjZhTDhmWVcxVHNVRjgyYWdlN25v?=
 =?utf-8?B?d3U1Y3h1cmVrNXNiaHIwUWVhOExzamRjMHhkZFFTeDZEaGtXYjlDK2Z5aVVq?=
 =?utf-8?B?TDlKNFIyVExuendiN0t6WWhWcGtxaFVFUEF6bjlsOTlYT0ZDU2JreUxwY095?=
 =?utf-8?B?WDh2bGx6OFJTUjBLdGw4K3o4aW9VN1RGSXFaSkh6UXYrK1I1amI0eWt0NUhE?=
 =?utf-8?B?L2FnbERpWGVFeWxQcjBZdVIwVi9TVWdpQ1FNcmJQK0tNYXZLWWZ0WnlSWDY5?=
 =?utf-8?B?SUpYaklQWjhiU2w0cHFOZkRZem1uWVk0Umw1WGtRaHo1YmlrQUZKL0V0VVA3?=
 =?utf-8?B?L1ViZ0ROdktPcVNXTHhaUE9iUG15MXo5OUJHeGVDcm9wbGZ2cFVlMFJ3eXlF?=
 =?utf-8?B?T2RycE1vdGVQTG01R2tnKzkzZ3VqdE5lcUEyLzkrTXo3VUZwT21SVUNVcEp1?=
 =?utf-8?B?a1JTRmF0bTQ3ZFM3VCt3anNaR25hNXQyYnNGTUJMRHRiUHNISG5ESHlPbklh?=
 =?utf-8?B?ejJtWTJ4S1oxRnhWak1RV3RwNGMzNzZzMGkyTm5MK3J3T1E0Z2tnb2tkYUwr?=
 =?utf-8?B?alJkZWFZM1VGWW5WOTlZRVRnQURvb1ZoNGptZ2t0UnJtR3Z5M0V5a2c5L2dB?=
 =?utf-8?B?c2xNSy92M2svbWNCa1VNN2VFdWlSc3VEZTFPYWFCWTlnbVAyTXN6UVo2U2Np?=
 =?utf-8?B?c0tBbzVLMWJRdnc3Z1VqLytNR0ZyK3dzclU4K1RLbGtpc29MeXJjYXcrM2U3?=
 =?utf-8?B?c1kwTmN1Y3RNUkFIL0hYMFlnUjF3SUlYSjNEVnhudmQ5andPd1VhcDl4S1lN?=
 =?utf-8?B?US81dDlwc29Va1lhZ1dQK3Urek5TMzloNEtZM29NYi9kaFREYUs2VWczM1lw?=
 =?utf-8?B?TlpCWGQvSG5EOTc4azEzYW9DdGtDdFRZQUxyV2ovdEIwSGF0OWVQS0l3NStm?=
 =?utf-8?B?Q09Oa3RFUTBiUU8xVUY1VkN6OXZOU3RnZnpyc2h4bktXWnMrbnBUS0RRRTlU?=
 =?utf-8?B?d3ltaXZ2anZ5MThhcnFPOW1CNXMzaWNDR05RWWFsK0pDWnYySnpHVnlndHV5?=
 =?utf-8?B?bExlRXZpSnJFelRzZ0Rjei8zMHlkY1lvaWN6QUR5aEpKVTdWZDhNYTVMRTF2?=
 =?utf-8?B?eTVLc2h6RzIvYUdHWXRGZWJsN3Z3UTBHVGxzMmZ6bU96TExPSk54c0FNMlBU?=
 =?utf-8?B?UTA0RS9TVkpaZWFKYW9CVDBhcWxKYll5UFVQbU40ZVRDMDhnemFvYWRkZkNP?=
 =?utf-8?B?Nk90V3V5b2dRTitITU9iM25CUXMrZzQyV2NmcUF0VE1BWTdVVkE5OUdFVDlE?=
 =?utf-8?B?ZG16MW03MlJTQzRhVUZTaVBpVDFWbWxIYzl1dGRsZWE2OXlzTGZsUk0wVXRm?=
 =?utf-8?B?SGg1YVJqdmQxQ1c2THo1eHJuMk5oZTZUdngwYlh3NDAyTS95Um1ZL1hhYXQz?=
 =?utf-8?B?ZzZFZ3FoRUxZUXZ3TDltOUZhT1FKempjRmhqenY3L2plRk1wd2FjSlVKdy9i?=
 =?utf-8?B?Wmp0bU9IYit0TlJqQzdTU2NuRGRraVc3M3oxbWxCLzN5YXcwd05PZ3VtM2NL?=
 =?utf-8?B?bGFYd0NKVzFKUlVXelZUa3JoYmF3V0dUdldiWnpCUFZ1T01jYzBsV2RUN05N?=
 =?utf-8?B?TUFlc2I0V08yelFlRHA0VWFpSnp4SXZVWTcycGtmM1hxOVBxaEF4MHV1TWQx?=
 =?utf-8?B?Nk9MWGNLZzJ3K1BxaFhNbWVEL0hCK0RsTXcwVW9ROEtYenFDZWd6ak9keFpR?=
 =?utf-8?B?MmRhMzVaVXZnTmNFd0NLbFNFeW1HWHZBeHc4NWhDcStvUmF1OXFNM0ovV2pq?=
 =?utf-8?B?MjRiMXZ3dlR4VmUvMWN3U2JkVWxpNkxPa2IxNERGTHpBMW9XUWZmSXdhZGdx?=
 =?utf-8?B?TkpHRi9NbXViWWZDbjRZU1Evb0J4WmxsVmZXcUUzbkRGQTh4cTBDd1ZVM2pi?=
 =?utf-8?Q?GqzeXwg4LFYXbz9H0pq1mns=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	voayCDNvImu+2kYPKzv9SIuOInI3OzHKqs8DR/QSAJywInJIQX5hG5UpmnGCf3AucQVr6Qyt5QyAYubCQYulAj8feDQqSssGPuHNoV9srPh3+LpfWuGI6/z3xMvGZnLwrs1k/qj51Ppr5PejueR4yE/qm8Ic/IGxjryrvK2bZyETMfDXQRF2ANYekeAHzebxrSBvH424dO54zmw6kCIz6zFrP+L69OxBT48wcD4di785zc4sIRnTzwcK1+Mdc3wdrKUySpWWcsXaOenifGHtyrnqwdTrkP0IEfkUxxsHRj+UV+14rmJ4UWf5lGtUUfoOJjOBWzxCMWHLfGvE02HYbEU/zdB/44vBjo/k/CXQfvMMi0hD4w+lR/GqQE7ICOfPzBlp0Py5FR/1qfVUONYXts1T0EywE8Mcba2HMGuprAsyGQKlzvkaI3ssTAF5RsloA8kRDjvD4Q65TpHdreMvTGLd8FER8WI+mbc3TWsWPXD7V8QA+YmiAC2p3PSmthq9C22BPyhD0bXMeZ+vKoyYSLfBQxFyVu1vYdZZ2C01TsYOWX85WlNVH2+ymv0ESr9V84VLRKyFkjB/nl8FhYTOmI2cgTkA6FYAdwvqBG5q9g4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf6807c-07f7-466f-9816-08dd5d0d7eea
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6707.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 00:17:50.4125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KvaKV9gnhP7rkCJJxsi/C4VKpFA99zc2ZUl3LSVvzHgeG1VYfUuxn+uShbv64mpr0wpWwESHmpkVXI+BpUWYZQU696xokKFqAotnwXAvkoQ9iGP9XGQx1ZmuwA3D5w7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4449
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_08,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503070000
X-Proofpoint-ORIG-GUID: VXDM1RDBbu7G4Rd9jWLDOydecNB6Z4HQ
X-Proofpoint-GUID: VXDM1RDBbu7G4Rd9jWLDOydecNB6Z4HQ



On 3/5/25 6:59 AM, Mario Limonciello wrote:
> On 3/4/2025 23:24, samasth.norway.ananda@oracle.com wrote:
>>
>>
>> On 3/4/25 7:00 AM, Mario Limonciello wrote:
>>> On 3/3/2025 17:48, samasth.norway.ananda@oracle.com wrote:
>>>> Hi,
>>>>
>>>>
>>>> We recently observed that the LTP rtc01 RTC alarm test fails on 
>>>> intel based VM's. This seems to be observed after the commit
>>>> 6492fed7d8c95f53b0b804ef541324d924d95d41 - ("rtc: rtc-cmos: Do not 
>>>> check ACPI_FADT_LOW_POWER_S0")
>>>>
>>>> I noticed that the use_acpi_alarm was set to "N" before the commit, 
>>>> now it is set as "Y"
>>>>
>>>> # cat /sys/module/rtc_cmos/parameters/use_acpi_alarm
>>>> Y
>>>>
>>>> #./runltp -d /tmpdir  -s rtc01
>>>>
>>>> <<<test_output>>>
>>>> incrementing stop
>>>> rtc01       0  TINFO  :  RTC READ TEST:
>>>> rtc01       1  TPASS  :  RTC READ TEST Passed
>>>> rtc01       0  TINFO  :  Current RTC date/time is 3-3-2025, 21:02:20.
>>>> rtc01       0  TINFO  :  RTC ALARM TEST :
>>>> rtc01       0  TINFO  :  Alarm time set to 21:02:25.
>>>> rtc01       0  TINFO  :  Waiting 5 seconds for the alarm...
>>>> rtc01       2  TFAIL  :  rtc01.c:151: Timed out waiting for the alarm
>>>> rtc01       0  TINFO  :  RTC UPDATE INTERRUPTS TEST :
>>>> rtc01       0  TINFO  :  Waiting for  5 update interrupts...
>>>> rtc01       3  TFAIL  :  rtc01.c:208: Timed out waiting for the 
>>>> update interrupt
>>>> rtc01       0  TINFO  :  RTC Tests Done!
>>>>
>>>>
>>>> I believe that the hypervisor may not fully support ACPI or may 
>>>> implement it differently than physical hardware. ACPI wake-up events 
>>>> may not be properly supported or may be emulated differently in the 
>>>> VM, causing alarms to not trigger correctly or time out.
>>>>
>>>> On AMD all instances the use_acpi_alarm is set to "N" so no issue seen.
>>>> On intel Bare metal instances the use_acpi_alarm is set to "Y" but 
>>>> no issue seen.
>>>> But, on intel VM's the use_acpi_alarm is set to "Y" and the issue is 
>>>> seen.
>>>>
>>>> I even check with
>>>> # acpidump > acpidump.txt
>>>> # grep "FADT" acpidump.txt
>>>>
>>>> no output from above saying that ACPI_FADT_LOW_POWER_S0 is not set.
>>>>
>>>> Is it possible to know we can address this issue? Should we make 
>>>> changes in the LTP test itself? or in the kernel?
>>>
>>> I'm a bit surprised it didn't also affect AMD; but maybe that's 
>>> because of the specific date of the "BIOS" for the VM.
>>>
>>> To me this sounds like a hypervisor bug though.  Could you add a 
>>> condition to detect this hypervisor and exclude it (and also report 
>>> it to the vendor for the hypervisor "BIOS")?
>>
>> It's not affecting AMD because of the first check as below in the 
>> use_acpi_alarm_quirks() function.
>>
>> if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
>>      return;
>>
>> In AMD systems we return control right here and the use_acpi_alarm is 
>> never set to true. But for intel the above condition wont pass.
>>
> 
> What kernel are you working from?
> Take a look at 6.14-rc5 and I see the AMD ones should apply as well.

Apologies. I should have mentioned earlier. I was using 5.15 kernel 
which doesn't seem to have the commit
3d762e21d56370 - ("rtc: cmos: Use ACPI alarm for non-Intel x86 systems too")

On the latest 6.14-rc5 I see the issue on both Intel and AMD instances.
Both of them have use_acpi_alarm set to "Y"

> 
> https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/ 
> v6.14-rc5/drivers/rtc/rtc-cmos.c*L813__;Iw!!ACWV5N9M2RV99hQ! 
> MSCvhczv2vkH0AFfUN6OgIpOEISmEW9BVob2fU7MLnPVbY6- 
> v3bgHGVojTh0KyfAoZzOUY1_AHlggpu1JtmiI2u7WQQP_UQDZg$
>> I added a check to find the hypervisor
>>
>> cpuid(1, &eax, &ebx, &ecx, &edx);
>>
>> if (ebx == 0x756e6547 && ecx == 0x6c65746e && edx == 0x49656e69)
>>      hypervisor_name = "KVM";
>>
>> I was able to detect the Hypervisor to be KVM. Do you think that the 
>> issue is due to KVM?
>>
>> Thanks,
>> Samasth.
>>
>>
> 
> What BIOS image is loaded by KVM?  I'd say it's more likely an issue 
> with that BIOS image.

I see this in dmesg so think it's using UEFI.

[    0.000000] efi: EFI v2.7 by EDK II

Also this folder exists -
# ls /sys/firmware/efi
config_table  efivars  fw_platform_size  fw_vendor  mok-variables 
runtime  runtime-map  systab


