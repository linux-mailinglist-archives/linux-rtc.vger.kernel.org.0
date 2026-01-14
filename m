Return-Path: <linux-rtc+bounces-5751-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21446D1FDEE
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 16:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F6A530B8E03
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 15:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DED39E6DD;
	Wed, 14 Jan 2026 15:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="P9Stxgc6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012066.outbound.protection.outlook.com [40.107.209.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50DB39E185;
	Wed, 14 Jan 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404944; cv=fail; b=h6j5lFk+hNgbR2GFKvp78qmO+vFdQ6pvq0URdLiAg33l3kqc8smywzO4MkDtXn+h+HJ16vVto/WvUZOcvbgI99obgrhDmI9RNLRpcAaOSDzOwV/eZtsQ8Q7Ku+zI8Oec+AHjge7gpNuAZ0HTQbABLpHXb0r8vy0hzpmwXibjjjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404944; c=relaxed/simple;
	bh=Ae5bzTO4ANcOCAJvpLLE/vCocGAioUjoY7VvzjgKM0g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FfT8Bq36py65HL4euQiLtPV2QpSk+QrhWwddckGtwBLuNMqwf0udf2MvroBq1Nu53tcjwkj2oKJvvuFzRL0PCwF4KD2IRTaUx2gbsqEEhXbGHZx9d+h5EksJsHBtc4OooJY1+TNvbKJfBz8CItDNlRxz0BocwiMQfnYYzAFs55M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=P9Stxgc6; arc=fail smtp.client-ip=40.107.209.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq00GoQlXjO30A3QMdSC5qWYU2SckJnXsEmvRqyTjmP40fl3+bdI4e2yt+ajfYlhfmzoikYmBjsyTimN756Rq+JDvXDI70TFy/x9X+99Ku6s5pe3DBxofaaUZWUqedNUS9TRHR5dnwXgJ7titUtxIEPbKDziT2nrpYHXDvgSB5pSbvAuQe0NJfNlIE71HyWR53p8fO0XBFUU7y+jR04UBjYECA8MhSieCSKHyAXsMHK+ee4BUaAeytkkyJovAGCg9jHBPR184WjA5MPapinroDNW7MrVmkJ5duDslJ+1u4x3d0PfsMDNct95sSJWD9TzVXAOKXHgPojLDK4FNe7lkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ae5bzTO4ANcOCAJvpLLE/vCocGAioUjoY7VvzjgKM0g=;
 b=lv8H9JZiH//TK9IkT+MlRp30GBcOZZqQZpmpznaoXAP0J4Iocas83ZWSL/b4HCADGNQL8xIa+qOnpUOrI6Nu8WmWck7ipxbCQ1EHnbNIzwCo2Ovm8oN4K+FGT9MfrC9gGzUl0AlsmyNz2u2yLf+iOgzXrSihGsD+k26nenelXz21Ur8EPDDgybY9bQK4x/yEQslgaN8oPL3p183LU2uhZPF8B1OTAnZYePQa0SVuv+4TF02EGnzuYtzzcrUx5x19G0HGilnLSrGmDYOfBgPu+LC6BKdILTfBCWoZrzQY7XoNaJ5w58k83psqE8z79D493BPhKhaqyY0+NtqVeDq9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ae5bzTO4ANcOCAJvpLLE/vCocGAioUjoY7VvzjgKM0g=;
 b=P9Stxgc6i1VECs+rzinkA/+IqHnlbyDrA8Td5xws6TVeJELmSjM4S62gYOqTrCoo9QcsoSzlVdcEMcGflZ2MAV40Hu/roJHvxnLrUSDFuwKC/YYtBkCv+qpGjE2gzhcFilYfeCxVmB8UiIk8Eghd7a4uQlMXSRHRFlCM9kPFURs=
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by DM4PR12MB6277.namprd12.prod.outlook.com (2603:10b6:8:a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 15:35:36 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2%3]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 15:35:36 +0000
From: "T, Harini" <Harini.T@amd.com>
To: Tomas Melin <tomas.melin@vaisala.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/5] rtc: zynqmp: check calibration max value
Thread-Topic: [PATCH v2 2/5] rtc: zynqmp: check calibration max value
Thread-Index: AQHcgLfeYTdSpdG50EePqDq0kcZHo7VR1Vhg
Date: Wed, 14 Jan 2026 15:35:36 +0000
Message-ID:
 <LV5PR12MB9804F999C047FB0BE695F8D6928FA@LV5PR12MB9804.namprd12.prod.outlook.com>
References: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
 <20260108-zynqmp-rtc-updates-v2-2-864c161fa83d@vaisala.com>
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-2-864c161fa83d@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-14T15:35:30.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9804:EE_|DM4PR12MB6277:EE_
x-ms-office365-filtering-correlation-id: 8f8ac5f9-a015-4975-e591-08de53829010
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SkE1WVlZS0toaU1UY0FTakVqS3J6Zjd5NVhQdWxYbGgrV05VUDZ5VG9mUVVs?=
 =?utf-8?B?U09yMkkvd001UEFHd2x1YUYveTB4dFlyV1hFYXBNclNHQXhmcXlNdTY1am8w?=
 =?utf-8?B?TG5WWHFaVG4vbTBEWkg4aGhOc1QzWTdUWkJrNmMzNklCR3MzNmVYRTYzcXpv?=
 =?utf-8?B?ZUx2d2gzWitHLzRWYmMxeDJnYTdwWEFOQkhuWTI1OGkzT3pDQWNxelBiOGln?=
 =?utf-8?B?d3ZzQnhML283c0trRi9qWWRQUEt6Q0RLYWdsNUVmRzNqemNuT0J0VHQzeHdr?=
 =?utf-8?B?R3IwVW9mS2xaemdvR2NIS1A5WlN0c1gvZXpYcE95NndmN3VQODlTRW9xQnQ5?=
 =?utf-8?B?YUY3T3hjTkwyUXpYTnQvbG03enRlNFN2aTQycTY4eHl4Z3M3MTR6UmpuL0xT?=
 =?utf-8?B?ck1QMHRLUDNKSWhoODNuYzN6VXJESnpMcXh2clZGL2ZvaC82a2F0SWlZWHpo?=
 =?utf-8?B?eGZMNHF2WVJ6VzJEQmVqLy8rN2lqMXFhVWZtTDNGTnBCakoxOTMzckk1VlVG?=
 =?utf-8?B?QTFPQTd3ZTdRNnNCSHlLZ2VvVGR2bEtIT1JZUzNucURTM3dzYjAvNjJZbHRI?=
 =?utf-8?B?ako1Q25pYUNyWEdQUG5jWTdMR210OG1PbXNGY0pmSDBkOWs4R3g0RkxGL21L?=
 =?utf-8?B?MWQ1V2Q0YnZVRm93L1Y1VFVEeUVhdXVQVGFXY2Jtd1o0MWNsalFGM2RGb3lr?=
 =?utf-8?B?QkIyQitnUzVJQmp5eXMwVTVsT0FaME1XZFlOa1FTMGNpS3RnTVo1RVdadVpj?=
 =?utf-8?B?eEpHa3ZNWEg4RFIrdi9KWXlmWWd0T0x2SmFjeUxJTExlS2M1WGE1V3NjQitH?=
 =?utf-8?B?Tk1MM3IwandnWFJHZUFuL3drQ29vMjA3dkZ3K3F1UWdRSHJQZ2tZZnZ2MlhZ?=
 =?utf-8?B?UVYzZWZEdHJHeCtyK3hUYnozdnhyTlNQVnJzU2dRdGprNDdYQUJWeUQ5STlV?=
 =?utf-8?B?ZUE2eTEvZGJNWG8zOVdUelhWMHNkdks0SXkwRkpraTR6WVNKUkdyNy8rTnk4?=
 =?utf-8?B?Z0dsM3VrV1ozcWlEUVp4aTR0cnBPaHZXcEh0OU40YmVZa00weFhIcGp1dTV6?=
 =?utf-8?B?SmtGc0orN0w2c2toZFZlZzk4UTBubWl4TzY4eWY1cmlFa2lzdUdySFpvTnJp?=
 =?utf-8?B?WUc1UldNUFlrUkRhVFRlZXlPODhnckpTUnF3b09TdVZPWGMwdnJQMEIwcncr?=
 =?utf-8?B?QlFFWHNaa2xpMThwaTloaHdvNkJyUmZzelJlelBHTjNlK0d5UnFMZzdmNlJQ?=
 =?utf-8?B?NWsxc0k0U1duVE03Tlp4WGswM0syS3A2UXA5UmRZQTBVSzNzdVNOQXdRbWdX?=
 =?utf-8?B?MTV6bTFVaXh3V3BNRVRobVhNNXM5SVI0TXpNMFI3L09lM3JzRUp2cnVHRldC?=
 =?utf-8?B?RVRpLzNZVDhTeGJ5RGQraFFVaWYyNDZ2SUc4U3RiOWNCSzh6MGFaamVIUCtB?=
 =?utf-8?B?bU9Bdmw5YW9BTUZMV1FwUFJJcHgyZmJ5cldUTmhQQjVxb3lzYURCY05nTVEw?=
 =?utf-8?B?ZDFRZ3Q2THVqYTlzcUU3Rmg5dEJXa1lHYmEzRlNOYi9RWndmSkpvYVRGeW1X?=
 =?utf-8?B?NWxVWlBxSmYxTVV4ZVViK2NaYkVpaXZOZE5WTFV5Zm9ySE9TSk5LTysySU9h?=
 =?utf-8?B?SnUrUnFTdnJucWhZa2RmbjV0NmRsNXBmc0JrWGlzSWI2TXN6bDBMTVF1aVp1?=
 =?utf-8?B?U1QxNklsa0FEZ0J1MTFqZG9EMXorQnZPQXpQN3o5dS9WVHJGOEJUZFFBVUxQ?=
 =?utf-8?B?dE1jQXZOOWxlc0pENGJxMnBKSEJZY0V6WlZVd3BrZ2Q2RzVqOFFWT1M0a2Vn?=
 =?utf-8?B?NktFZzBCNHg3NkhFL2dSbVFTTDhsdXhvWkU5SDhjRmZKUzM0SzNITG5zbzZ6?=
 =?utf-8?B?TUpEcUYzZklqTit4RHhVM2ljMTM4N1NmTFoxU2NqWFVwTzRneW9ZTGhVc2s2?=
 =?utf-8?B?NDNUZUYrVmJ3SFdFVjBOOHRWcGxuQ21pdEJFVCsxTE5ONE1sRW9jcmprM1RV?=
 =?utf-8?B?UjlydW8xTHlQNTY4c0RBbzJrbzZBZnE2ZDNHYVA1Qmg4L1VhamhoQU1KYVpP?=
 =?utf-8?B?ckZiWHc4KzBUN1laanZOREJqMld3RDlVOHMySXZBMElwcFhPVzZqMWFabUhE?=
 =?utf-8?B?Uk9LbjBDOXZHZnNOTEk3aHVkRUQ3Z3pXVXFUenBRYlZFZ2hQSldzNkRzZDU2?=
 =?utf-8?Q?9zKHOfzzBE+DyoVWiJ5DWD0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWFOZUhMUXFDV1Zzc2pFNFdpa0NrVHdiYkNmeGxnZkozcXpkcVd1WEdyRjBS?=
 =?utf-8?B?Qy9RdVFXOFJLeUtzTnBQTWZrcHU5TXZEQ2lVUjVwdFhON2V3UGIxSG1iQ1d6?=
 =?utf-8?B?V25wNWtTSjBZNy9GcEw2d1hFelVSOHdvZ29yd3N1cWZsMzVQNXQxOVJ3UStu?=
 =?utf-8?B?b2NmTnNIMDZzdHRZcURaYlA4SjN2elNRU3d5QmtmR0lJY0ZUTWUzZ29WUUlj?=
 =?utf-8?B?UEpmaG1ITUkxelFlZzAvdDhXem5WWnI3WXkxY3ZJTS9QY2tKaXMzR0RBa3VM?=
 =?utf-8?B?RGNIRFhtVDQvU293R2FWQk0yOFgxRmhodnhIeUdZNWR3TWRvb3JQdmVyUzRX?=
 =?utf-8?B?emg5OFI5bjlWTmcvZThweU05bi9yeXRhcEQwMXZTTSt6N3hPVmQzbU5zT2dh?=
 =?utf-8?B?am1JSnZTMHB2M1pjL0NINXM3U3hBMnNlRjVQb0orUlExZnNtaWozRE5ybzBh?=
 =?utf-8?B?U1dmMHJTNDZveEQvT21wSUtRZG5YVFlFZHVIc3F6a1BHQnlwRnBXeXZ1VUow?=
 =?utf-8?B?a05hYUgwY3gyTVhjOWluTS9RNVZZSUYwcFE4T1JtclNHQ1Q5aFgyVENxaDhh?=
 =?utf-8?B?VG1JWlRTL0hqSEdIT0RGa1Jtb1ZnaS9HSmUrZFpwbExGd2NUc3M0OGNlYjZn?=
 =?utf-8?B?cGtlSnd5bUE0eE1NRWZyV2xNTTljbXBQMms5OHBQMWkyR0w4Zzlid3pueWhF?=
 =?utf-8?B?VGFRek04RWNMK3BCVVNaZ1Y2bmNVYzFJM1h5d1NmQ0s2T0hyTEJyemVnTXdl?=
 =?utf-8?B?dHhBTVExUDFsZWxadkVYOURYNkFzVkZFMGJGdFB1VE05RWg1NXpIRkZwODhY?=
 =?utf-8?B?OXRuaG0yMGhaME1MNHAzdUs5SUhjbkdrcDRzanI2T2ptQ0FiS3cyNVBHOEsv?=
 =?utf-8?B?QjhBK0M1Z2p0Rlp3YlJTN2Z5T0J0WmVwWUQrV29ETHVZb3Fmc2w4VnV6WGRU?=
 =?utf-8?B?dXd3NUI2ZzVUbzQySkF0Z3lOelN0dyttckpkU1M0dGZ0MU5kaVQ2UGp1a25F?=
 =?utf-8?B?c3VoU0dxSzk3Qnk1b00zWmpPSENUYTEvT2l6Mm0rL1paZVkzTm12U3Yrb0xh?=
 =?utf-8?B?c2NudW1vYVZoV2x6MWlxbld4QmNCTVpQVGFrWVVONXpHTUh0dTYzcXdBU0Y4?=
 =?utf-8?B?MmZ3V1JOQU1YM3EwSTVaUEl0T2czNVN6cFA2WDg5eGJlT3dpWlQ0TTJ6bitZ?=
 =?utf-8?B?TFFhSWxkOVpqb1cyT25LUlhmYnlTS3B3WituZ3FURG4zZVJ4eVNBVVBZREpB?=
 =?utf-8?B?UmVXK0VJSXZ1Z09JZ3g5RGc5MTFKRGhuZlpGaEhHaEc2WEFDaXhibFA2SlFS?=
 =?utf-8?B?dTN4WjRPTUhJRzBxdy9XUGVpdUhLbW9QWjZPNTM5bmxBTlpKVENCWStpaHFt?=
 =?utf-8?B?NXdmUDZPOEhqWTlqQUlmL2tXT3hoYmsvUTRUTkV2QXI4VzE0VElxQUdFMDQz?=
 =?utf-8?B?SlBiL3RkaVlHcGR6ckRDTlUxZWV2Uk82MnhYZHJITkdIaHdzWnhHQTFKS2ha?=
 =?utf-8?B?Uk9MTkpwR09MNG5NOGlvS2ZqSURXSTlTUVgvM3ZwTWxVUndKSEN6M3F1cnph?=
 =?utf-8?B?cThleGI0TFdtMW9WRVp0Y1cwSHQwY2pzQ1lnKzB4YWtaZDJsTmsvU0dHcmhQ?=
 =?utf-8?B?eTRPaE51ZEV6WjN1am52UlVPMHFuU29UeFVPRW1LRmw4R2VRTWJuR3RuNEMy?=
 =?utf-8?B?Q2tUajFRSDRnc3ozRWpZYXJIVnJ2R3ZOTXlWK2JManJXMG5tbjFReHVHdlZp?=
 =?utf-8?B?cHN1ZC9jcnlkR3N5b3dteDBKNmxheisrV0h1ZG44Nml5REQ4eTlRZGFtWmFN?=
 =?utf-8?B?TUt2UEZ2aWQvUzJWTGh3MWlZOVRWMkNuclpJUWtxZUFUVFE1b0QyOXA1R2tI?=
 =?utf-8?B?dlFlcWhKSk5GTTFLRlVWYTJ6ZWpnQ0dVT0RrZjd3blhOdlIrZEtmVXRHL2Z1?=
 =?utf-8?B?MllNZjVYSktSRndZOHViTkI1VGZPNUdPMlhoOGY5WnhzamE3OWRVeWc2ODRu?=
 =?utf-8?B?YWtpN0E5Ulg3S3NYMHhjV2JoN3l6d1kyWUdPSG05aURIVExqZUV2dDgvekFP?=
 =?utf-8?B?NWRCaUxGZ2FYKzBRUWdycDJzWUQ5YVhzcXByWW5NdFZwYW1aZ01ZL3J0aXpX?=
 =?utf-8?B?Wi9kbWV6WnROblE1eXdPdHZmT1M5Tm9OT1ExQ0FuaktCamlidnpneHNLOElQ?=
 =?utf-8?B?Yy9YLzNBWnVNVVFNSXZQK01MY0JVdXlKMEUyYVFITG9IVzFjalhQaFFXS08v?=
 =?utf-8?B?UmtPQzlndXo3R3BBRkpiQzhKZ0txUzE1ZFE0QW4wOFRKNm9HbCt4ekFOVDVL?=
 =?utf-8?Q?oN0PY1labZbazbicAl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8ac5f9-a015-4975-e591-08de53829010
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 15:35:36.0632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yFSNXSvukplcPHTNCvp44/WA9j+7yL2H50lshFFRpnbRdovC8xlTOQuLMYiDGMH/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277

W1B1YmxpY10NCg0KUmV2aWV3ZWQtYnk6IEhhcmluaSBUIDxoYXJpbmkudEBhbWQuY29tPg0KDQpU
aGFua3MsDQpIYXJpbmkgVA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4gU2VudDogVGh1cnNkYXks
IEphbnVhcnkgOCwgMjAyNiA2OjIxIFBNDQo+IFRvOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFu
ZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+OyBTaW1laywgTWljaGFsDQo+IDxtaWNoYWwuc2ltZWtA
YW1kLmNvbT4NCj4gQ2M6IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IFRvbWFzIE1lbGluIDx0b21hcy5tZWxpbkB2YWlzYWxhLmNvbT4NCj4gU3ViamVjdDogW1BBVENI
IHYyIDIvNV0gcnRjOiB6eW5xbXA6IGNoZWNrIGNhbGlicmF0aW9uIG1heCB2YWx1ZQ0KPg0KPiBD
YXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4g
VXNlIHByb3Blcg0KPiBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcg
bGlua3MsIG9yIHJlc3BvbmRpbmcuDQo+DQo+DQo+IEVuYWJsZSBjaGVjayB0byBub3Qgb3ZlcmZs
b3cgdGhlIGNhbGlicmF0aW9uIG1heCB2YWx1ZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogVG9tYXMg
TWVsaW4gPHRvbWFzLm1lbGluQHZhaXNhbGEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvcnRjL3J0
Yy16eW5xbXAuYyB8IDUgKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy16eW5xbXAuYyBiL2RyaXZlcnMvcnRj
L3J0Yy16eW5xbXAuYyBpbmRleA0KPiA4NTZiYzE2NzhlN2QzMTE0NGYzMjBhZTlmNzVmYzU4Yzc0
MmEyYTY0Li5jYWFjY2UzNzI1ZTJlZjM4MDNlYTQyZDQwDQo+IGU3N2NlYWViN2Q3YjkxNCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLXp5bnFtcC5jDQo+ICsrKyBiL2RyaXZlcnMvcnRj
L3J0Yy16eW5xbXAuYw0KPiBAQCAtMzQ5LDYgKzM0OSwxMSBAQCBzdGF0aWMgaW50IHhsbnhfcnRj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAgICAgICAgICAgICAg
ICB4cnRjZGV2LT5mcmVxLS07DQo+ICAgICAgICAgfQ0KPg0KPiArICAgICAgIGlmICh4cnRjZGV2
LT5mcmVxID4gUlRDX1RJQ0tfTUFTSykgew0KPiArICAgICAgICAgICAgICAgZGV2X2VycigmcGRl
di0+ZGV2LCAiSW52YWxpZCBSVEMgY2FsaWJyYXRpb24gdmFsdWVcbiIpOw0KPiArICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsgICAgICAgfQ0KPiArDQo+ICAgICAgICAgcmV0ID0g
cmVhZGwoeHJ0Y2Rldi0+cmVnX2Jhc2UgKyBSVENfQ0FMSUJfUkQpOw0KPiAgICAgICAgIGlmICgh
cmV0KQ0KPiAgICAgICAgICAgICAgICAgd3JpdGVsKHhydGNkZXYtPmZyZXEsICh4cnRjZGV2LT5y
ZWdfYmFzZSArIFJUQ19DQUxJQl9XUikpOw0KPg0KPiAtLQ0KPiAyLjQ3LjMNCj4NCg0K

