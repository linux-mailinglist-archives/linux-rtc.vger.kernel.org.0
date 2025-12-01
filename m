Return-Path: <linux-rtc+bounces-5497-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FEEC9764F
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Dec 2025 13:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C75293418E0
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Dec 2025 12:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AF930F542;
	Mon,  1 Dec 2025 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="0ti1EpK9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022083.outbound.protection.outlook.com [52.101.66.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D60B30F928;
	Mon,  1 Dec 2025 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593455; cv=fail; b=IjSXh9fJHy9nqnacqkNRpSeF6QlqJaDJOxheqzxMZ1p/9wIYybR7vEIKmDqHfqyl+p9KcDo2a0KQsOpsGJ9pYZeoIL/+AlPniJLYAjIqV4iez6hfb427Fy9E6EBnlQ+xsGCAX7WDBhIbuoskGGBJNSM2lkOUPCu6nfBfVsguiJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593455; c=relaxed/simple;
	bh=oEUOU2sYyoKk4nt9iFwl2WKa5Zo5PQStc9bApXKp3mE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UXzEkmttX8mRYm6ZZ1D8dcPcARaXiBufZyuShm9w9RLCIvTBt1tcLRq5KCWcOYPDPYYAek9hpTr0NCQmLbI2ivwR858ZaCbfqCgNtjd1tC0PSk4GbkiaSXvvFbNgn4lgWUkOYj4D9jFe98aP/wYViOKWGeBxj02Y16vAwNVLqao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=0ti1EpK9; arc=fail smtp.client-ip=52.101.66.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3J525qclSMZg2kEMAHnGIXIK1gySjeR+dYOtOGgR6ExdOZ2SqFgnKjXBRBlZCadQk1xh9M2PpyacM8GFe6r5T3ujLKbOyUAasWY8T/U0CvZDMRz6fnmNFokKhgxqXziH12v3wMgZDObElMPKDTuXmxns1aA4gvpee1ME2wmVY3BdbwGJKMqiBdD3hp5eVt26kGA4XsAhRXXcWS9nO3b8NfcrusCoVwNYQuu8JQO4MWiBMAuHKGCWnOO1nzzP33UymhNtOyhq4oBM/KFzNSsHFfVorJiWP866az1UiuRB9dcVJldRA48nSISHUm0wI88gbnnpBX2UBDiCZb81p2tzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzG0bwU+LT4PnpjR2b6zXeg45quwJ45Gu5XDVuUSGLM=;
 b=ZnokWlF8EpDJiSr/WdAN7Kvtnq39cXXU71Y+JixH3h2YwqXX5B4PcNTsFwRq1qhfWXrEImS6RNgr164QHfhuRxjJ1Rn2qilFTn39dAMhEqtkrIo8EizN853Q9iQUfY43AzsQZtP3O9MRbG6CcwAyV++RZ3BdWCivUIJoRXd6sZFT8Y3vL+x3WUmf69lO6EtWQrmIrabRWuUl/1gpngCp48s1jC1JOvp57bZxJV8E0fAdBoqyIU1M9O0DQamlFRTSBIu8rjB7Fbd3F6zIOZQAqCOxIse5BEEXEq3SYMiZKH8MVg9rvwYO1gYfrx77D089BZyePbWMuvVsxkdfwt6SEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzG0bwU+LT4PnpjR2b6zXeg45quwJ45Gu5XDVuUSGLM=;
 b=0ti1EpK9XcuRY10aD/6iV/08UQCtudf5YDh0WYoKlWtWIgQOqzowIV9CPF7VurGmNsWBjQ8lInCh28dgEUZ5jWCrLkYxi0ZVYQwDgabvF4XbqP82HopZDZQkYw7jhf69p9Qf8oGgFCtrZDhs4ReMZNf1opiy1C6BT8o04mJ0HcDI10XJMHvK3mgEKvqVltPyz1HvZRIvMroPuOCAOat03P7jkldxY3Ff7/H7pSYQhwETQws1oN8fpuUfuVDLTxM5sOBBVuz4baWqULZNxOZ0X7ULXhaIJSEMIRRIauThCa7Tlu85hgnNrBJj8cNPidoTby+XMoVl8xfMSJQGNnI7qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by DU4PR06MB10410.eurprd06.prod.outlook.com (2603:10a6:10:61d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:50:42 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:50:42 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Mon, 01 Dec 2025 12:50:26 +0000
Subject: [PATCH 1/4] rtc: zynqmp: correct frequency value
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-zynqmp-rtc-updates-v1-1-33875c1e385b@vaisala.com>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
In-Reply-To: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593441; l=828;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=oEUOU2sYyoKk4nt9iFwl2WKa5Zo5PQStc9bApXKp3mE=;
 b=wSN/DzwB+Ly0Xf7m9p07qaN9iD9xd/6G2AcbOZeOaj1d8yq1Md5dtvonCNNn2Tx1HlnqQEtZc
 EPTYWDZym3dDf43LptOIdVFY591scax9o/3ojy13Vg++Fs7BncsIPIq
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GVX0EPF0001A050.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::49f) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|DU4PR06MB10410:EE_
X-MS-Office365-Filtering-Correlation-Id: 72feb601-5a65-4d40-1534-08de30d83c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDl6K3pOQjJzbWkyK1gvVVJUeTRGVExtc1B6ZDhXZU5MWllkZ2hPZFo2Z3pL?=
 =?utf-8?B?QkVLdzJDTW13WGFJOWVNL0duaENrajF3cDU2bmhQVExwOVBCdEJYU2dBNmt0?=
 =?utf-8?B?VitvRXgzdXl6b1Yxc2N2UUdwcUVuanY2L1N6aE8wbGNtNUZlNHFPOFk1L0Fu?=
 =?utf-8?B?dVFZRGtvSjhNUEZ2NU9YN1lIWUV1SkJwVTcxUXhoR1BhalRmaEtPNU12YlBS?=
 =?utf-8?B?RE16U1VuYXE1ZDN1OHAwbnBZS2ZRUWU4MzhobHJEeDZkaVVSb3lUSTNmK29a?=
 =?utf-8?B?aTczQTRNOEtuMnJCbG1iQ1Q3L2tyTDhHQUFxZ1ZlUHlFV2V6SlI0bW5jSkVq?=
 =?utf-8?B?bEVINFZ0eGJVcitxSk10WTNDbThkL21WQlBQbVNEdkdacVVxODlRSWdlaGta?=
 =?utf-8?B?b1doWUtZOTlIajhLZk9wb250cUpFZkkwTFNxcU5ZYW44OFpnWFlzKzBHbGpN?=
 =?utf-8?B?di91bUpWakJ5RloySFRrUlFGajdjYml5dk56MU1Dc0UyNHRYcGJFS2h0MnFq?=
 =?utf-8?B?UmtNekpkNGszMCtXQU5GelJUZmdkbkVQWWRuZm5wTzNFVDAzeFYzNGo2T25r?=
 =?utf-8?B?QUhkR2NBaGRBd204cll4eXFqUVRocGEvMmFTU0g5cEN2eGJUM241MFppNlFP?=
 =?utf-8?B?Ky9VUDVka3BxbGVCVG5iSXFlZEljMk1LVDJveEtTYTQ5cEpEZmhDVXFrNi9q?=
 =?utf-8?B?MVJnQTg2UW9ZeDh6Q2I4cXA5c3B6K2Q0dWlKeStCOFlOQVZTcWlLcGNXTjR3?=
 =?utf-8?B?emhsSFExWmVNaVgxWWNWSWJ3aUJkaVAxd2hka0xTV2JJdS9qS0cyV1N0aUZ4?=
 =?utf-8?B?T0hwYjVnWjZhS3dVVFVsYWgrNlVRdjAvc29tN0pITkJFRmo1NTV6RjNtWm5q?=
 =?utf-8?B?OFZaSnc5NFloNlFzSzVMcG5QNkM2N3lYcW55dlUydm01SjJYbklrWFMvVWlM?=
 =?utf-8?B?MDdUQW9CcWdIYzFRbW04Y2J2YTNzS1dOdlQ3ZU1IQ0VmSVBKU1VaSFdidWts?=
 =?utf-8?B?Mmx1WWJsS1FKSXBDbDBsZTM1d0VEcm1WTWg0QUVkRE41RDVFZEoxdC95UnlJ?=
 =?utf-8?B?T0gyMlpFcFJVMEY0M1ZaWU80Lzg4NGFNY1dsMWJJQ2x1NjYrd1JTNzgvLzZv?=
 =?utf-8?B?ZXV5YjdvK2ZxZ0UvTUJtdnBWS0RHMFBwZlRLWkZsRlUzUW5hMG9UZnkxUk9E?=
 =?utf-8?B?MmdGMDA1OVNOQnFnOU1XcVlvOE5oNTNoNWRMd2ZQQ1RDcDc4UWlMK2FCTjRy?=
 =?utf-8?B?UzZZQjdWa1B4OHM0aHlsSDh1dWFWOEZxOGZ0amZXQ013V0RhRTk1blZ2Qm5B?=
 =?utf-8?B?enJyODBabkxBVVl2Q0RQNEY2eGlML1NMSFRYY282VjB6M01DQSs4ZmRQa25Q?=
 =?utf-8?B?VGswdmt6RWEvZTF3T1JsejZPVGZNZ3ppOUFSTGtkdTRYNmVsMU1PcCs0eDk1?=
 =?utf-8?B?T2RjNDZXdEd1MDA5KzE0TkRrdUl0VUc4REQyMDExK3AyaDVSWDQ3R3NMNWRl?=
 =?utf-8?B?dDg0TjVqYnFYdVBocU80eUxzOExqa2tsYlFLZ0h6a2E2UHFoS0lwbFUvMUEx?=
 =?utf-8?B?QjdDcThkZmc2MCsraU13WEI1NTVQZFJ4Qzd6bEYvRnlDZlh3dThIYTVtaE9h?=
 =?utf-8?B?V1p1Z0p2M1hGR2NlcHovdy85b2Z0WklId21sZmZBeEFrWno0OHN6V3ZiWmZS?=
 =?utf-8?B?ZlZJMDJMYmI0UlU0Y2tkKzVQZ2dSUnB4NlRETzcrVy9qaVBRU1lMOEROcHVC?=
 =?utf-8?B?ZW5oYXk2eFNRMmdVbjFEU0lnbW45b0VTYWJQYVlwMkI4TDkzMUE4ME13Wmcx?=
 =?utf-8?B?UmRNN2p1cmlxQmdYVFFSMXUzT2lrK1BlclAxa0xSbXZJQU1MMHVKNUdldk96?=
 =?utf-8?B?L1lnOTh0OU1oQnNLaFdKSkdORGJRODRDMG9wbGVpOUVBb2F4VFU2cVJhUzhF?=
 =?utf-8?B?L1FXMGt2azN1TnkvVUNZYUEzOEpCT0RKN3BPT2ZDN2VhakcwWXQwZDhLa0c3?=
 =?utf-8?B?cHpScTB0WTI4QTYva2paTExaaVAzU0N4MXJJdHpOTU9tcVI2MWJNK29Kdmoz?=
 =?utf-8?Q?8Ik/sP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFU3NjJRa1BIc1BxdDhwelhZNVFhV2dNM3VZTHFNQlczUGNBclhscWliaGUz?=
 =?utf-8?B?aThXVFhNSnVwaDRFTnBBanN3Rjd0VHpJNDg5NGRpNS90dThObUpVa3Q0NUFu?=
 =?utf-8?B?d2lXaVc0WHRYQWxsMWVEMGV3ZFBhaHVoaGFFNEg0ME9xTndqRFhxN1ZZckZR?=
 =?utf-8?B?bDNCaTZXUzh0MFdKS0owZ1hLNVNSekVwM0F2anJReFdlQ2Rxdko2NU9hZUFT?=
 =?utf-8?B?bURmNWlZZGRUYzUxVGVHbW5GeWM1am8renU5dmRrMG9JTTRzZlNRSXo5WGpS?=
 =?utf-8?B?cG9oeW9rbVUwMWx2WmJlYzgraUtXRU5hSmJEYUs1MXdQVEVQMjByS2JBanVH?=
 =?utf-8?B?NU1MeTZqSExaSUpCWmE5UGlSeVdTaitOUjNUaFBZQ3RKNjU0S3ZycGFydnRI?=
 =?utf-8?B?TE9iMnQ1QWt2YXU3ZkQ2SEZOd3RqUUlFTXBkRnU4bk5vZTg2T284M0RncFp6?=
 =?utf-8?B?bjdUbjVFZnA3VEVFaG9zOUI3Y0FpTnNLR2pmOCttcXN4SmtoK2tBQ00zUEZl?=
 =?utf-8?B?bjkvUk5leTF6RW83NEp1dUR5UEcrSldJdEtuTjUzbE9HeFhQU2J0dnlHbVRp?=
 =?utf-8?B?SUk5Ny81MjcxdVMyUnRZSVRibnh6NW1Mc29WL2pUUHM5QkFmeFBXMjVPMmVZ?=
 =?utf-8?B?SmtGNzQ3NjFPM09RcGdpK09Jck1Sd1NVRjBwSDNmNGZIUEwzSmYwSXdGLzdV?=
 =?utf-8?B?RUZJSmtGOU9rV1BNTGN4ZTBGM0JVb3EzNWRWUlhwcDlMZEhhcnFsRjVMa1pC?=
 =?utf-8?B?cERFajdtQ3QwblNxT2VKTElBSng4dytiOTVoeTc4ZGZ4WHZmOCtOelREYkNu?=
 =?utf-8?B?MVdvSTZQeVRhbG5RZ1J4N3lFYXZ4c1dPY20vWWtjbVBYNTBQVnRQd20vbDZB?=
 =?utf-8?B?eXhYTzlQYUNhakt3ZDVXc2VPbnBkOTRpOHhXczZxVVc3Qlg2SXhmbmU0SjVu?=
 =?utf-8?B?bG9XMEFXbWxpeXpwVE9makk0R0U1Z3ZrMXY5YjFLbEVoaEJQbHV2TUQ1Snpv?=
 =?utf-8?B?NlZwMlBUV2FkVm84bmREbElwbWwrbm9ZMUYzT09zanRONGEvZStETVhsaFFO?=
 =?utf-8?B?c2Uvd3hkRDhpWllMVmZNcktPR3NOdDRuNnZMbHRUeVpzTzJ4L2xCSU8rc3M1?=
 =?utf-8?B?eHNSS2dQaEhkcVc0Syt1T2VHOWhBN2xMTjZTOG1SR0JDWi9JQXRpbmwvbmNC?=
 =?utf-8?B?SnBrN2FqcTFhNlZjdDQ1TXRPVWkwenBPKytSZGU3bGJpYW1iNUNCbnE3bndE?=
 =?utf-8?B?YmlBaHpHVEpxY2JKZmpyZi9xenNJdmUzRVpQY0VqZHFleW1YL2c4Mm80eHQx?=
 =?utf-8?B?NTRqLzZOajNIMEd5bTZIZGpacldRQzg1MDZDYmVnLzRMOHhCN1l0T3JXK0hj?=
 =?utf-8?B?VUtieDFuQ1dZNDBHMG0vMXpZUmFUNW8rY1hIQS9KcjRoWHoreE9rUlpid3Bx?=
 =?utf-8?B?Q1ZWL0RBaUFqUWRpRjZMUFdjdFc5azZ1YUZ1VkxYZjBLNndJL0lEOTF0WDN2?=
 =?utf-8?B?VDYzMnprNDkycHQ2UkdiakI1c0FnQ2lyRTMvZ0xZQm1CamcxMWd0cFNneGRW?=
 =?utf-8?B?aVI4dFo5aDhVU2lkNEJlak03MGdYbUtoN3hRdlFpNWpiU21xcXVaTFFvcjVS?=
 =?utf-8?B?ZUVuZlBSN1l4SjYzTklKK3FqRGlSQVpwWGNudjVDK0pjbWFnTEZJNEIxczN3?=
 =?utf-8?B?b20vdVJZRnMzVlpZdVAvTGt3TSt4YzMzb09UTEVuRE5oRTdXYzNZSU8vRlJr?=
 =?utf-8?B?YWRiWWZqZ3JEeG4xZFR6bGlmS24zekZGa2pDaVJicWFaeU9GN3NteldjK3cz?=
 =?utf-8?B?dG1KeFMzbXZDaFZrZHNoRFNWbDhkYjVkNFR1RzZuVFF0ZVViNjJNK0ZPVGNr?=
 =?utf-8?B?aUgxQ3NETllTV1haR200RnU0WFQyNGphcHRENkZXem5PRjRKT2QrWjl6SGdp?=
 =?utf-8?B?UG5QbFBrc1U3Qjd3aU03K0QvaEl0R1doV2wwTmx6K2U3TmZEcXJSUlBKalVR?=
 =?utf-8?B?U2llby9VaG80UmtHV214Z2tQMDJxalVPV25MMWxNYmovaVB5Ui9OSjhSMDF0?=
 =?utf-8?B?eUg0ZVlJWDZOTmZTQVZIOWpqQi9nUGQ0aFZGb2RDd2dXNmxpRitDU0hVak00?=
 =?utf-8?B?WU5xNDU2djgwSTNxNWJZc0k2dE11NVlVVUVwTk5VWW5vMW84OHUxa1RJYTZG?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72feb601-5a65-4d40-1534-08de30d83c80
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:50:42.0243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svNIKBne7EG8eN5MOJylpsPUez8JFq5Ov/KcAfFm81PGngxiuOh9sGs9LbOzQWNEvVEHy2UiTihNaYOF+CeVuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB10410

Fix calibration value in case a clock reference is provided.
The actual calibration value written into register is
frequency - 1.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 3baa2b481d9f2008750046005283b98a0d546c5c..856bc1678e7d31144f320ae9f75fc58c742a2a64 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -345,7 +345,10 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 					   &xrtcdev->freq);
 		if (ret)
 			xrtcdev->freq = RTC_CALIB_DEF;
+	} else {
+		xrtcdev->freq--;
 	}
+
 	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
 	if (!ret)
 		writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));

-- 
2.47.3


