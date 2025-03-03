Return-Path: <linux-rtc+bounces-3377-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF048A4CF71
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 00:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2707F3ACA60
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Mar 2025 23:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFA81F2367;
	Mon,  3 Mar 2025 23:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dIZEbp0o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W76MjGJz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA3220EB
	for <linux-rtc@vger.kernel.org>; Mon,  3 Mar 2025 23:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741045795; cv=fail; b=PnCsLUbEQMzXsDn24rhe9pK+RNuuUHJbpyB0jimEscBZEwf619eRRrYeuDYF3Q38TdSC/cn4YmURP16RBi+0hfs47k5NVyaVTY36+jzENTWzJn6mbz7v6XdHYSjwsodBBWs2p5H+R6hfZNpj5tnu3JE/o+pWMFMFvwL5kVoPDqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741045795; c=relaxed/simple;
	bh=brs8/MWN7hvroGV5qJ//3XbiJz7O3B2vj5N1WozXtGw=;
	h=Message-ID:Date:From:To:Cc:Subject:Content-Type:MIME-Version; b=DJFiKgxFxxy9sEXUhZusaC6JWaqirFGcV+2WIhpTAiAlFSkdH1I0kHpl52uto2ZNfx9qbK3hfk5E+IhP9oH6U8Pz2lbn5oFtJsQc2AF1xBb93hfFPVKEiLI4NlYapaWyS/7cXDcXEIrIRH2PESx9ak3LpZPb+FlkWaq2I46GDLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dIZEbp0o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W76MjGJz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NMi55032173;
	Mon, 3 Mar 2025 23:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=phqrp9YRwYDO9dyn
	09T8OogDduqI4FXVn6kIHnsRmyE=; b=dIZEbp0oRGhIc8H4q36zsxFwyf5bD98H
	1YOUvMiaDV5uBKv9sl+6O2hTbRzJc9bjRDY9CVDD9rlqmTvdBrv0btkP49SkXCgB
	DThxVjXLJ5f7Tyk2EcIi7KGH8pFu1tFWN+9kQMQtKN31wY7r2O9BrhOZSP4rsHGh
	Vy079MQl4CmF7fOAAoRDziHTjxVRyc195BaZ1BdXH3Q+v6RhcbuHwvsrUYWBUcEp
	EQ82a8eHuQYCbADi/LGQznyiLZlSGQwclAg6aVTZRamqL2MZgrGuMI3SOYPKXSSf
	LmxUTCjzlFviy9GVmiypfpXF6baktr534iPcN3FWdZXXg4SXkgjwqQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453uavuufq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Mar 2025 23:49:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 523M4cnU040345;
	Mon, 3 Mar 2025 23:49:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 453rpefahm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Mar 2025 23:49:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uykpL1kgWCEN6uksHN3nRrVpYwudJu+nDKRMnnNPCmTtdCoA/3onsWeKfKJGGyx6IYDZMe+gfnBdz/AMVmeqngemJVuspZMGLAglmWwlu+oVByggnfhjP/wTB3I0lLaUGweQt5c9mTcRxwzmax/ziU32HxQ7HOffPuAflAodxvsHpWPlrYhwnbmAHp9OAPmD1E1D8TqG6xRCLAhe4mqNmy7zE4zc0fGiLoO6+IFWtumx6xt4PiQEsLFFbyevsoMqfpDIDJ4wXzlNOpMGhqJZmvbWgvlsg7pfXRARIlNAzQJH0sZOs4FqhyIcLtJ2aMax4QlH7nH13+XcILGwDzGu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phqrp9YRwYDO9dyn09T8OogDduqI4FXVn6kIHnsRmyE=;
 b=RP3PrKvCZGb4wR03oMqgKl0RSalTX34PI9X30wV0E/gNvjnuYHuSlYNiuvwh3KHgwnmzGeFB5+6hWrv5toKlVOaBVKZFaO1TAfP44mjESCSfUURZzZIQPJmg67fQSRByqhplAWf3inbGR0MGOGUb/CXIXC5qBWcCQD+NRguznqzgEhVuwY3ZCkzgtkOrcNoPGWRe545Mp7RGHKDu7WaBt7c9YQJVmAYMCXFKIDCGZ8oMNApD3qpGh8tpAssfL/W0WcsGdYRU6R69gDoE1yhF0ZF6yxgQAzajx7DzL/aYcawrOzT4xUB8CcsBfitEJzAWL0nEspFIQXxHbScV4tOwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phqrp9YRwYDO9dyn09T8OogDduqI4FXVn6kIHnsRmyE=;
 b=W76MjGJzZsb7IwMccnEVijFd4hlEGK9rINCdWrJBeSo6msi7GlIWdGMoaYW4c7lVOU0CUzKaSg+vjYdQuVYXTFTHC6L2bCXELN8SMcWoFgVvP0IZxIJv0x8TbYIJqWtuGwuENnGxhI0ffZCXtNaxAx/lrwW9QtIFrZZDYruMubA=
Received: from CY8PR10MB6707.namprd10.prod.outlook.com (2603:10b6:930:93::22)
 by DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 23:48:47 +0000
Received: from CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::ccf3:1df:e15d:7465]) by CY8PR10MB6707.namprd10.prod.outlook.com
 ([fe80::ccf3:1df:e15d:7465%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 23:48:47 +0000
Message-ID: <dc4c018c-77f0-4cd1-81c8-929f40e6162f@oracle.com>
Date: Mon, 3 Mar 2025 15:48:43 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: samasth.norway.ananda@oracle.com
To: rafael.j.wysocki@intel.com, mario.limonciello@amd.com,
        alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, samasth.norway.ananda@oracle.com
Subject: LTP rtc01 RTC alarm test fails
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::31) To CY8PR10MB6707.namprd10.prod.outlook.com
 (2603:10b6:930:93::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR10MB6707:EE_|DM4PR10MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: f1216562-8324-4415-183f-08dd5aadf0af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHNZNUtiSHpQUlBFYXlXckM0b2dLQnRYYW9wQWlpSlRhUWM4bmlLU0t1SU5D?=
 =?utf-8?B?K1krTjNUQVYrbGRVVFM0STIzQysybzl6M0ZuREpCMFp2UmxuNm1UaHlPZlZF?=
 =?utf-8?B?dU9TeUhQY29tYWhUdlAySFg2bEhiY0lBZUxoU3d0d1dwUk04NG01MlNNU1lu?=
 =?utf-8?B?OWNhR2l0QjJ3bVBYQVhkUXNwMEZzZVFtNkNhYndNaEZWYTJZZHpLUXE0K0Y2?=
 =?utf-8?B?eGtRcDljR3lQUUYxMVRVMXVVUXVjck0zMnZqaTZaUm9jT2w3TmFIU0tMSS9Z?=
 =?utf-8?B?SitQelRYd3B2NFhjZGJGQjJlN2QzU1k0aUFYOE4xNTRrM09jWG1RY1NUbUdJ?=
 =?utf-8?B?bjBBanI0eEtsaU85ZG5GRmZjTXZrVWh2NDJwY2dyaG9Ba2VVaUhVcm5ya0VF?=
 =?utf-8?B?c1lWSjcvQkxCU2JzOXc5WkpqMlpTbW42VEtDdnk1WVVQckxhMEJWNUdObTdM?=
 =?utf-8?B?ejQvSjZnY2NsNzBDTUV2SUpPQ0ZVTlU0ekE0NWFJaVVTSWxQRGY4UDhsam44?=
 =?utf-8?B?V1RBRmlFNDZPc2xBSFFJZWJrMzZwYnRBc05NSm9oZ2wxeHlBclRlQmNhbkVN?=
 =?utf-8?B?VmtVZmtOK3NWMkN4cFRvZHVJU002RHE0T2JGTG1TcGIzUytZeG1OMzhVUk80?=
 =?utf-8?B?NkVmYmUwd1hOUWlVbjFmN2VTTFV3WUhnNC81ZG04SWhtc2VmbGxEb3lNQ1Jj?=
 =?utf-8?B?cXRpUTB4MTZabFQ3eDhRVHdRYVNzKzlRL1NNOStmMVRrdTRnRDNmT2VZemlz?=
 =?utf-8?B?aVk0Q3dUdzNXYktIQzU3Mk5qL09SZlVoaWhKTURSZDRKbDZzTk9LeTZ5Y3BK?=
 =?utf-8?B?Nm1PSlFqZFV3WWFIbVhiU2pmTjR3bnRYZzBXM0tTcnpFZWxhck9zTnRwbVBt?=
 =?utf-8?B?MXF3MjJXZmhJS2xzbkJENXRRaFNCUFBvTUtMekpxbGs4MEhOQnVtcmVyT3d3?=
 =?utf-8?B?WEhSYU4yaXpGOElUaTY0ZW9UUDJTU1NuM0tHVDh3MXE4WXA2cHRONEJ0Lytr?=
 =?utf-8?B?bGFiOFpialIySjZ4eWZ4bVMwZWxYRU1jVWEwRnFCVndnM0hOV2ZOb3hUVzFZ?=
 =?utf-8?B?ekhmOTh4Z2pxT3FVSzI4cGJQWmovU0FKN050OS9BTnlqU2dyamFSWTNqU3c2?=
 =?utf-8?B?czAxbit4YjROQkY4ZVlpQXRacWlCejJZdmZ4SUdsQkxuMHAxamtrWXg0Tlht?=
 =?utf-8?B?OFV6SFJPaUNMRkNEUTZ0RnY0QmkzZk0yU0tIWTZ5SnRhUjlmUWhGZ29DY2VN?=
 =?utf-8?B?M1c2M3hPYkpCRjd1RlQyZTExSmZWRURPS2I1TTd0THlWZ0c0TDdXQVl6cWtp?=
 =?utf-8?B?ZEZzelA0WXRYM0xjUXZQc3RwVWpDSHhPUjNRNXlid0ZsY1A5R3IvK0toTnRH?=
 =?utf-8?B?N0RDVHhMUnVHSEcyNTZmQWUwbFp2eGhWUG1PUDVMbk9Qc2VEdi8wY3lhQ3Y4?=
 =?utf-8?B?YTM2elhZWnQ5T2xac3ZBRmZWTXlBL0xVNWFXcHBIRG1La1V1VlQ5WHFiSm1B?=
 =?utf-8?B?Qy81NjJWNVBGZkV3RFJHUSttSEpKdkN4UWNoeVNSNUE3RVIxZldqTDVka1FQ?=
 =?utf-8?B?Q1ZZSHhsay8vbHZWSFpPWjEweC85ZGh5ZnNHeEp3Unc2N3NzNE1BRVZBRmlh?=
 =?utf-8?B?K0lRUmdnNlpsNkRGRThxenIzUDk1NUowNjZPYzdYOFIrSnNnbVpHVzR6UGJU?=
 =?utf-8?B?bzZjbmJVVHhMTmdOcUxmNXF5ck1JN2lvQ3lQQlc3ZUR1bkdaL0hYZGRPVVFE?=
 =?utf-8?B?bWh5YTFVSEV1dUEwc3dQYW5mK1gzeUNtWVNOMXpkMWhXZGlDQjY4RnpieUtm?=
 =?utf-8?B?MTlxZTZDSlF0QllzeE03d3dRZktmQkZVRDY5UkxCcHJqQ2tkUUJwa2M4eURl?=
 =?utf-8?Q?NbQ7onnPn3Fay?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6707.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWdvR2JMRkZqK2FOeFFoVER6MFE4eTFRbTVXREhNdE1WY1pmeGFqSGlOdVFT?=
 =?utf-8?B?ZytxYTFVVndlUTBGcTNlL3JveVpscVZyY1NYTDdaZTJ3c3VwbDZYVXRwRDJi?=
 =?utf-8?B?cE00cHg3dDRtR1VQZnh3MFAyWXRNU21hNWpTT1RaaGZiYkcwejNFSjNzSGtC?=
 =?utf-8?B?S2F6c1RKdXdWT09hOTRYRHNzTXdVUkM5WXpGaHdzM0lVME5PL3N1d25jSkpt?=
 =?utf-8?B?WG5oa2pIRk1kYmYvVThUWG1oaU11ZjhoeWl2R2pXZFJUS3RNdDdoQ1h5WWlx?=
 =?utf-8?B?SzREV1BEckxUdUc0R3dPNDkxOFQxMkMxVCtyclJRVCswQ0I5TVkycURONDBE?=
 =?utf-8?B?bzJ4QWhYL1NCclpmY3M0WVNVS2l1ZnpmdjBuK1F6UG9Sai9ZVmVFUWNlUFlO?=
 =?utf-8?B?SGdlaVV1Q3k3TUFUTTIvTVBHOW1QdmYyN1Irc0RZTStobE5QRTVZRWNtMnBZ?=
 =?utf-8?B?QU9xWloyUHlJWGtXd0tBWitlZXNaeExEaGRQYUhMa0piOE1HZmJETVBKdUF5?=
 =?utf-8?B?ejdPZWdRRG9MeTUzd2xTQXMwRkdweEdKMFh5UDlhZzNzZnN0aWRPTy9HNTJT?=
 =?utf-8?B?dGVlUjFvQXFnWXgvcnozODhNdUw3UGFjdHJLOXVkR0tNY1ZpTTRYbFc4dTRK?=
 =?utf-8?B?TXJycDdXQnFIcVVSOEZHWUs4QWtwbTBNektTSU1ZeWZLV0xydGxPOTRyVkFo?=
 =?utf-8?B?RHFyUXBPVkxwSHVMNW5pQmxHS1ZvNUx2STdWa2FwVFdIMWdtVmFSUndweE1J?=
 =?utf-8?B?c3crMVZhRHQ0YVRMcWs2RkJXdkFGODQzNmdqdmdwenVFQkE4Q0cwcmUrbTZD?=
 =?utf-8?B?aXF5YSsvQ0xsTjV5TmdMVFFPRjk3azJIdGtvdGRzd0p6a1JXZEVLcVZxQmhO?=
 =?utf-8?B?OFVGUHdtWkQ2aUdpUkRxRDk0VklGYmkxb3VVQjUvT0g3RDZXL3lSUFJEQ0Zr?=
 =?utf-8?B?M1JYOXBSR1I1UFpzRXZXZHo4OE9TRXRrZEsxUUp2b3FScHplaW9Sb290WWpV?=
 =?utf-8?B?dlMyQSt3a2xjK0xwbFo5KzVlWHhwSnpYYy9DVENwajNjczdNWkY3RDF0Undp?=
 =?utf-8?B?QXViRXk0a1pRNVo3N0hiNmVtd09TZW9YajNqbyt6Mk5zanljUnpCTExKWGlI?=
 =?utf-8?B?dHhkTjk2dEZnbldyWVNPT0JMcXZueGZoTTdqckFqNEYyT0QzU0tQVTJsK1hG?=
 =?utf-8?B?QUhXUFBLOXRsSVlCcW1QZDVQY3Z3QThPNjBUOHRSN2VWNUpwcmZmUy8vYnpB?=
 =?utf-8?B?VzZJTlFITTlqZmxWZ3NrYlpNakJGd2dyRlpuRXhVZ0sxalBTN0Q0V0l5SVNB?=
 =?utf-8?B?eUV6TkQwb2RrZWNVM3VEaEhDYnoyUmIzOG9xd3BnWjV3UHZpLzRVK0poSUlu?=
 =?utf-8?B?Uk4vN2hjejFFZFJBQUNjMWVZYW9UdFFSd3RLbjVxb1M1TTJ5dzZrK3lvUXF4?=
 =?utf-8?B?QWx0ZVRnVHhMYmFHdDd0QnJYR0FSWEFEM1M1Z0ZuMmhGTDZ4bi9TNnhLK3NT?=
 =?utf-8?B?blZSU3VmVWJ3d0pDazhEVFdVL2xORWFpTWlIT2xmNTh0SnFCbmNMcnlSSFZv?=
 =?utf-8?B?cFRVQXc4WGVOazNHVDJFZitFV1dTeFdxbm9NbFNia01mWWEwVURBM0ZaNnZQ?=
 =?utf-8?B?WmNxQTVyM0xMQk8wMnd4dkZCd0ZzQnFNSC9Sc24zM2xScmtrMlFram1YVFZt?=
 =?utf-8?B?Mnl5Um1vSFRJUmVOcVErdmJZTXJCdHoyNFhjdDEvVWhKeG5HSmtDQW01eHFp?=
 =?utf-8?B?Ty83c2Y5UmFjZktMakZxT05IYXlZSWNod0pmcTRwRUxuV2x5Qi9pMXoySWVF?=
 =?utf-8?B?UEVBSExmWXpNeElzdVFSZ2p6Z2FHNUgwK3dRU3hUTTdmMFVUb282emwzR1F2?=
 =?utf-8?B?OW5acXNMbFZ6bW5jVWo5YTAzc2l0R0tRYXVMNUJldnNjaGpyWTNrTjZRWVpj?=
 =?utf-8?B?UW9tZ3JEK2djeVROSDNuZkRDYVltV0IvMDMyUlR2dGRhdCtIa1pLTXpwenlZ?=
 =?utf-8?B?SVYvNk1MSzdtdmN1dkhJblNQS3ErR2xST0FaRUcyZ1VuU05ySmdqaVpza3Y1?=
 =?utf-8?B?SVZlM1NoTDRCYThOSmxjaWdGT3F1RGJJbmFUYjN3NHRPUkxZYWlIZHdwcTkr?=
 =?utf-8?B?dzNXQVVQNS9ONE5VWTlNMVJWRnRzbFBDejhQUjFDbENBdTRTbnZSRTYyKzJj?=
 =?utf-8?Q?2BWkA8rWZj2j7COX68gnIbc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hT43DeCgsTBA1sIaVkCIJmkIU2CzkEH2aLHSIeeRHzW/vqv4mcPsG1aZZs6LdynaauUnT9aSqMmvRhdHPKhSBwSDgAQ1WEwHYf3tjFVAXYPWqrCtWaj9zMQnUCx8zngMSexpaWikPP0ZoPUu/VsaV3I7SlfdC4/4CBnBbQfN4v1Kwtv/wP4F54s0rXhDD3RMiviZfloa8fjMJ9bz0kTye/OdTeke6wP+PGLh6WONN6aYulxkDncZDqJaKrJYpYPdg72G8jTj3JeZODLTu2wRmsZ6oQJ0QPhn79jOaISsVo+pyuh1La6yB6DvHNq12Xusyb31hwi4E45u/RPazAcEtRae1gQiaBEw/rGiiCtNbJE3PNwjAYy8clrkyqgfnNGobBNQ37u1dmEgNLhT5qoaArIuJpVZ+nxKb+aE9yoGpogO5w2cVyT7i8X3vEPZ2gvAf0DtUCvGI6f+KfgA0VW5uDxmqJF4g6wKFAk7nG9PunLGxjkVJBZ9R22b6CY06MrvBa9jcyIwtwrCt19PEHLlE7Dyc4EolgFQ8hjsAO5kFoEvfWezWVbLH2h0WjgUM1N2rksS4F443b1GZM0a3M0Pz6pLrUd+72nN9W2m3V7dRzY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1216562-8324-4415-183f-08dd5aadf0af
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6707.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 23:48:47.2101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNzD1SWe1MsGd5VB1E11gIDQ99mqhp5NdqckBtKv9DFUCMuUH8is1HJ2hVwE4cMnkNUhruZgdMrI6BYQEHER1TV9bBjcXPhyekLpbGPwcjEkIu3K7GqR5GdTTeeuIhDh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB8218
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_11,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503030186
X-Proofpoint-GUID: bFrt3nV_Obxec-WEeKtRGv2X5WlvmdlH
X-Proofpoint-ORIG-GUID: bFrt3nV_Obxec-WEeKtRGv2X5WlvmdlH

Hi,


We recently observed that the LTP rtc01 RTC alarm test fails on intel 
based VM's. This seems to be observed after the commit
6492fed7d8c95f53b0b804ef541324d924d95d41 - ("rtc: rtc-cmos: Do not check 
ACPI_FADT_LOW_POWER_S0")

I noticed that the use_acpi_alarm was set to "N" before the commit, now 
it is set as "Y"

# cat /sys/module/rtc_cmos/parameters/use_acpi_alarm
Y

#./runltp -d /tmpdir  -s rtc01

<<<test_output>>>
incrementing stop
rtc01       0  TINFO  :  RTC READ TEST:
rtc01       1  TPASS  :  RTC READ TEST Passed
rtc01       0  TINFO  :  Current RTC date/time is 3-3-2025, 21:02:20.
rtc01       0  TINFO  :  RTC ALARM TEST :
rtc01       0  TINFO  :  Alarm time set to 21:02:25.
rtc01       0  TINFO  :  Waiting 5 seconds for the alarm...
rtc01       2  TFAIL  :  rtc01.c:151: Timed out waiting for the alarm
rtc01       0  TINFO  :  RTC UPDATE INTERRUPTS TEST :
rtc01       0  TINFO  :  Waiting for  5 update interrupts...
rtc01       3  TFAIL  :  rtc01.c:208: Timed out waiting for the update 
interrupt
rtc01       0  TINFO  :  RTC Tests Done!


I believe that the hypervisor may not fully support ACPI or may 
implement it differently than physical hardware. ACPI wake-up events may 
not be properly supported or may be emulated differently in the VM, 
causing alarms to not trigger correctly or time out.

On AMD all instances the use_acpi_alarm is set to "N" so no issue seen.
On intel Bare metal instances the use_acpi_alarm is set to "Y" but no 
issue seen.
But, on intel VM's the use_acpi_alarm is set to "Y" and the issue is seen.

I even check with
# acpidump > acpidump.txt
# grep "FADT" acpidump.txt

no output from above saying that ACPI_FADT_LOW_POWER_S0 is not set.

Is it possible to know we can address this issue? Should we make changes 
in the LTP test itself? or in the kernel?

