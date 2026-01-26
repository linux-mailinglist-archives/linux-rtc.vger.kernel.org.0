Return-Path: <linux-rtc+bounces-5885-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BXiLNUQEd2mRagEAu9opvQ
	(envelope-from <linux-rtc+bounces-5885-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 07:05:56 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4D845FC
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 07:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2938530036EE
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 06:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C7B253958;
	Mon, 26 Jan 2026 06:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="noh5y8sX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022098.outbound.protection.outlook.com [52.101.126.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1A323EAA3;
	Mon, 26 Jan 2026 06:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769407554; cv=fail; b=PBO83V+fgOHDN7FUeYRDrsF5bECJqNeYlwu6Bhv0CrEHM2ts6ew8MmQl+FAZ1x2IGWAH4nTZTGh46Aw3s4KjzfuCE4SGrGTtGJss7zDD5orbnaOuTKwZUTgR+2r5FfwM7lJnBvPelo8iY4gDWpUke8KDEGLvTc9pBBiEMSZmURQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769407554; c=relaxed/simple;
	bh=FQvPQ9ipFuBajf5ivz+8pxbRmiZgbQV4tixjFnfoZgA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=saHFHN3NmBXozsNN0gkOh/6fAGgL3X0DiLs5l5IVEMWFkcb2I38G2XnLtIqI4ORCZEclix1Lff69sJPBWfS+9Gx5TACpkZLMG430Wv/Qzj8/AKKxsFaKlQluu3OpSSLFACMVz0Q3YET/im7zy3uGvKQDPWEwjpqBZZYV6MFOa5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=noh5y8sX; arc=fail smtp.client-ip=52.101.126.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwtnS48cTaLZWda1sKw7LMzQkT/sG89ENIanlsN8fN1T6eDBtcXDnjn7bnwRLsRZ07CEx3ikgR+9IewDMjF99omJX36pBe2WEPExThRR0iyBrf+ATcXZGCgHgIzIKnkA/4Er5Lp1MOC0OmegE0fcQ5V/spzx36imq9Hk/0Q3FLRwnBI9yKJl+kgXO9rUxphDApRpCGTTXE0+IHeicJTA9TIbH0u0oQu6PqZpTU9UDAaGakJdYwxJIQlx8MR7xf8P2f9hDjQ3ASIJtXtY64DPXxQBLwsY25IJH5MrEfJOEby8dofusd7LdCEXS3Nb0fkN8JigxjtYZTt3euVDaw2QYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9KxA2gqWr7iLRuU1F42S6Iw/Nfum5QTNkDgoD7cbiA=;
 b=YggyBdzTZAhYVPAeuP0drWDI1DUABKIcvpXt+vpXHx/rvITkt0zyU7ySfhPznZL6+BI1cOhBMyP6fhj2EoiPgv5NyS/LnVgtBCCTSxJcALP5oUkaoLdlXVQDScVvXFxgvnKDvK8lyK5XCT06suQv4uh5GSvRjXMxdcvadcFXqkpKy2DKXcHHdMj8n5HqECICTKBVFyBBaqweph6lGgFAXU+Ez+gRhrKgxGwn+Wv7WCARLp3Asl24/abbq1m/73D6wrKCvSgH78E0XvsaQSw+VrvI5WL834ktAMjwJTCRSFNN3FGEc5mY2cWHB7xJkJxYLIQR5bEa04Ktmeii0Dmyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9KxA2gqWr7iLRuU1F42S6Iw/Nfum5QTNkDgoD7cbiA=;
 b=noh5y8sXB2f3laa6DrN2HDI5g2V2F1F0AEUghIs/LWj6w+UPYjM9IU0OqWr7z+6IHpz3IDDfIJ+Vu1/jbJKcdXeaDeRBxoPabGFo3mTJG2bKBM6oJNiVY3I28A2DdiYDlyT+jREF5ZW2DLblknHEvhRlTrOt/ITnK3g8qXjg/FpfqZg/0/EHQgq38LFOMgtuRMoDE3S3JX6anq1VB3udmEWDI8G0XG5Rz8U0l2TlBSVk2vfisV/ImMjlppspiOGEVLOPQE/UQctvk6MwnR+3kf7vSo7r4l6iXlOCXOqX0dsQGbxBGpiu9keDQ7easAfgiPaRIBQEV1k59o+S/mY0qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7337.apcprd03.prod.outlook.com (2603:1096:101:147::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 06:05:50 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 06:05:50 +0000
Message-ID: <22eeb976-8e4f-48e2-bbeb-a92f91503bad@amlogic.com>
Date: Mon, 26 Jan 2026 14:05:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/21] rtc: amlogic-a4: Remove IRQF_ONESHOT
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
 Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20260123113708.416727-1-bigeasy@linutronix.de>
 <20260123113708.416727-15-bigeasy@linutronix.de>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260123113708.416727-15-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0200.apcprd06.prod.outlook.com (2603:1096:4:1::32)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 35aa9711-bf57-424e-0d6e-08de5ca0f46a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGJEVVZwU2xJZmNxUFhFZEJPdjlseDhJcXQwMEc3b2RNR2JtaU9PVGFmUnND?=
 =?utf-8?B?eXJ2SW1KTDZIMHUwNnZOWnhjWlU3MW1vWWVwTDdjYm9RbE1PVVpSWjlwdEdG?=
 =?utf-8?B?Z1E1ZGx3alN3eUcvb29DcVpHZkpHTmlmamc1ZjdDOHMydjg5aG5UTlFwS3Nj?=
 =?utf-8?B?NzRQMkNxNzVEYWNhcThxdVE0MDZQZ3pmWXkra1llK3Y0cDUyWUFCaVFMTSta?=
 =?utf-8?B?VWpVTGZXSDBoUDl1WmtrYnBQdDhIeVBub0hGRkJMQVZrbzg2SUxRMVBNbnFq?=
 =?utf-8?B?bWltK2VSbUJFSWtUVnYyVnRpdnJJZGxOWXNqMTlITVc2MlNIaU1ZQlBjeHF5?=
 =?utf-8?B?U0JsVzMvM1VvMjJ4bGJDSkhlbk5yaWhGenBZcnFCV1lLTTZ3bVNBS2Z5TzJ0?=
 =?utf-8?B?M2lpdW1reEEvb1ZCUk9LbjJrVDVnS2VGT2VyZnBLZmIxcFdoQnBCWW1xZG9h?=
 =?utf-8?B?SzhCcmZxWmFUbkgzdW9YS0xwam9EcXFpUGcrMXo1RVdYVkFiUVdLVUdrTWY1?=
 =?utf-8?B?ZjQxUDhIUmZVbWFLRW1DRTFOVnFkWENNQ3c3dHo0ZWdZMktCb1BhK3k1c0Fy?=
 =?utf-8?B?Rm9BT1FOa1hWcWRwekh5U21acjZCRTEzejBXSzNUK3RYcnFnU2M3ZDdkb2o4?=
 =?utf-8?B?RExWRnEzeEY2dGJEYWovdFlIT25sdEdhLzdadnVVWERTN1RiODVWbFJTeUZG?=
 =?utf-8?B?dThnd2UvbjNjdU83WG1nOURQYmNPT1BwSm1SNmowbUJyS0VrZTcrdFNvbXhE?=
 =?utf-8?B?bHc4SjN0UTE5MlVRU2FZbDBnTyt6M2NqQi91aWxQdnRYMFlZVjVRVXZ5OFZw?=
 =?utf-8?B?c1hlRzdTR3NaQ2E2a2FjUjRKQlNiakM2TFlQU0lPNUIzZ0x5VUY2OVpFa1hB?=
 =?utf-8?B?MUo5MUtQN203emlWNUdEYWZObFQ0MWdRVHUzdGJhQkdDeEN2eXdFQStwMzFO?=
 =?utf-8?B?NGI4MnBDRFVyai9iaU15emVHV2hSeC9rTGdFRThOS0VtZi9UODNHbEU5UDFO?=
 =?utf-8?B?a1pibGUzTGo1cGNqRzJMc3ppV09jMzlvYjFzdndsNjNYQ0RQOVBnRXFvSlQy?=
 =?utf-8?B?a3o1eEViVWFEcU9qUTZDN0ZYMS9FZmlGSkl3eGl4YkFSckp1Q1hLSVlTdWZ0?=
 =?utf-8?B?RU9kRUVKenZVdG02UmFNWDJaa0tDZlhMQ0tWK21BUlppZFEzSXBDWldBV1dx?=
 =?utf-8?B?Y29yenpYOWxxNWRCSDBLUHd4NUptNXpvRkdDZTA1dVZDZzhlbTJHMHg5Q2Fp?=
 =?utf-8?B?NjVuN0FNTklxMVAyRlBjNmx3aXJJVkV1QXVQOFBCSlFRR1YwVDVqcGZ0VER1?=
 =?utf-8?B?R0QvaXhZdi9tQlNKdVI0cjhMemtGL2NHRmhobzJtTlRHOVdwNy9lSlk3SVFi?=
 =?utf-8?B?MngvaUVQOG1SRDJjK3MvRWlmODU3NzgwdFUvdDIzZ0hkTFl0M3dOaTEyWnpy?=
 =?utf-8?B?cEFhdTZSNzlJUDdWTGFEcGs3TEQ3SHZacTJoNEttYXJiYmZNOHF3dVNqUjE5?=
 =?utf-8?B?U0MvcnhQSGo3Z0V4ZUxHL2Zrb3VCRm1zMVhKZjV6bmZzWHNsenZBZm5GcjJ3?=
 =?utf-8?B?ZHJCVlNQZHQ1UjgxNDdzQ2Y3N2xUUnRuaFNjeG5qWFp2dkgzaG8vWU5PcEVY?=
 =?utf-8?B?MDIzdXhlSDRCZ21FM3JXVE9oNE5WZDE4UFFkNnJHTVg4REpHRDZBeDJGcW9x?=
 =?utf-8?B?Ykw4SklMR3NQdlFVNzR1L1hnNkY3dGYrQm1GT2xOSXpWL0QzN05JN040QXpC?=
 =?utf-8?B?YndNa241RTg3aDVaZWFGSGdsUWJyR2dpUFdnTlcvT0hLNEhJZ1M4OTAzM0tU?=
 =?utf-8?B?N3RkZW03ais5ZUtyQWNJTWpYVXV1Mi9Pc2N5TER3elNlUlFGSDJJTDdEWHNo?=
 =?utf-8?B?OXVUaDRmZXgyMk9zRkF5T2JtaU84VGxHaGwrVjJTVit6N1JMWTc4VG9uNGJY?=
 =?utf-8?B?Zlh1eERGSlBzYVZIZnpDMHNvSFZRWDZNTGJlaU1HNVBQU254OFFLSks4amNB?=
 =?utf-8?B?bTFkOC9mS3M3MVZrZXJrR0RoeUk5clowUnlKaW10VCs0VkFRY2l1Mmp3ekcx?=
 =?utf-8?B?dEdOdmdFWmdwOHZpcVk3YTBnRnE0YUN1ak5yUkl6VVNvZkFUaFdYeTEvUjdV?=
 =?utf-8?Q?pS+I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2c2eDhGTUZ5ZnczTXQ3clFwRUg3bEhpUytCMFF1aitjemozWHk0WDlZUVh1?=
 =?utf-8?B?VjhuVzA2YjVSSHpOOGgvbFl5L2pCbXVMbXptbkMvVjBNSTArdEF2UFhMaHRY?=
 =?utf-8?B?QXBVQU4wa0FrNEZOeWUxbWlBYVQyYXlGNjc4aXg2ZEVxNDhSYzJUUjN5NXVY?=
 =?utf-8?B?ZHVCUUdrWE82dWR1WVRtd1lKR0V5eFFhdFdRZFo5RmRRZlVZS0JlZkZhUGF3?=
 =?utf-8?B?OG9ISVhsY21tUTVqNmo0QnYrNkJrY0VZeWdLcUNycGJESVFDM1JNbmltWVNr?=
 =?utf-8?B?Ky9DakJXejVYREJvSTlOQVRBTnJsN041dWo5ZmpwbzlUbDRabmRHNWg4amh1?=
 =?utf-8?B?cS9pb1RLWnFiN2MvUkNPOUIyQUtnRkpXVXpQakxDYVB3MzQ4bGxLM2RnNVlR?=
 =?utf-8?B?bkozVzNndGJFSnZJWmd3SjhOQzRYK0xlTUk3WWhxU2JOWlBzVmtwdUxGa2p1?=
 =?utf-8?B?ZWhObTVqMW1ybHlURWIveXZNTkNYM1h4b2g1QjROaHV5TnovSVFIZXB6ZTl1?=
 =?utf-8?B?cDNPSUhydmJOWkd4dTlqaEpCanNsMGRtTnhQNjRXZXBjVExqWWhqcGs3cEFl?=
 =?utf-8?B?dEFxbDEvcHFrdXR3cjNmbng3R3FPRzB6S01wemxXemZsNzZ3V2Q3bkFVOXF2?=
 =?utf-8?B?aHF4NEVjcy9YTE9JNkx3NkhVZGEzVURBT2haWWQwSmxyYkZ4YTEydy9WK0dq?=
 =?utf-8?B?Sm5DcnFBNjl5Ym1RZXBMZk1BbDJnUUIvZ2VwVzB0alM4SkszR1F4b3JtZWJk?=
 =?utf-8?B?cnNHUTVpbGpGTVF4d2JRK1dmWWl5VVRmK3dUenkrTGxtZWMwM2x1U3FyMHVZ?=
 =?utf-8?B?eFlnTXRQWUlSVjh0RXoxQjhIaDhIZlRKNE9FbS9pK2lwRitZclF5ZmRwWVd6?=
 =?utf-8?B?Nzl0VGoyOXArelEzby85czYxL0pUMnduNnpDS1FtRFdrQ3Q3eDZLYmp3YVRi?=
 =?utf-8?B?WTNPckFPM2FyQzhlRTJrTDk3V0VrWFY2MnR1YmxuSm1qd0E4WVhmM3J4c09J?=
 =?utf-8?B?RXRjRFFrOVhoZW5VT0tkc2lvbHErMjI5YlYrQkhReWQxM2FNNHdxYWd0TC9u?=
 =?utf-8?B?aHltVGZla1F4Nkhnd0FGQ0hKcm5rUjNpRWdmbGkrOGxPSW83ZC9rS2ZjbElX?=
 =?utf-8?B?a0xWQktBNEdEWm44YTJJOUVLbm5lRGNZRkpvUUtNQVZDMHAzK3l1Q0JZRHlD?=
 =?utf-8?B?YmZxcTdHdFBiLzJZNHRPcHZCcG0xZmF4cThRM3l3ZFRFOWVlQTg1TXM4YkVE?=
 =?utf-8?B?ZGdUYTNqS2RoSm92MU8xSU9SSnRxQVJzL2lNcXZwby9KUmNOTERuNXJITTdX?=
 =?utf-8?B?SDVrd3oyYkZjaUNILzhXUW9QL3B0VWVTWXJaNm5sTCs5N3JrTjQ0QTdaeXFL?=
 =?utf-8?B?bmxsTi96U2hBMktUVis3b2hjU1NQNmVJK1BVYlc0WEVDQjVteDZocUpHVktl?=
 =?utf-8?B?Y29sUG82dWR3ZFUveWV0M2NESGpTallNTUJWdkM1RFgrYmFaMmpJREgwNmVv?=
 =?utf-8?B?OTU3VXF5VGNZOWpldmo3QWp0ZFo5RzZRWklNcTBibkNYR3BXRGdMeVAwRnRZ?=
 =?utf-8?B?dEtRWVE1Qjd0LzJXNnMwemhJaStsYjZ0dXlKNlBEZTAxelVGVWdlZGpvR2tk?=
 =?utf-8?B?V09FYzZlNU1hOEJSVTNUdmxCVy9GaEVWOFdXd3VFMm9la21HR3ltQ0NBSkc3?=
 =?utf-8?B?WHZoWkpKNTdyeGYrQUcvQ1VncGd2eDlNZHh1V0pxV1k2TzJZZVpaK0RTUVlZ?=
 =?utf-8?B?cTBsTHBPMFRMWVdFNEhMdzlITStrQVhabFJnREUwUUR2V0srQUZoQ3FKSkV2?=
 =?utf-8?B?ZjhXaEQwd1BQajdUMDgraUdtbmNuYloxYkYzdHJtVWwxeUZqRGxaVVJBZmJj?=
 =?utf-8?B?RUJLcjRTczVIZVJpZ0d2UGRnUmlCcWEvNE54ellyK1g4bnFNQi85RFVNcE9F?=
 =?utf-8?B?dGYrZzRBV1JEVzl1UVE1STFTc1JrTGphUTZ6UW00TnFCNkpKT2FLNUcwK0xR?=
 =?utf-8?B?emV6Z3RqOE9ZOFBsd2w0ejZ0aU1aWVRFVTc4eUltR1RkRDBZeDhVTU0rNWc0?=
 =?utf-8?B?NjEwS2ZaMjhHd3Jrd2ZjRnMwK09qcXk3Z2lpVFRSL2ZaRUlzRjdrcmNsUjBa?=
 =?utf-8?B?eklDd2FEdXdBQ2xxczI0SmdORGR2eVRCUFVmcHMyUXlyNG9EcldwUmxkeGRC?=
 =?utf-8?B?L0dwZHFBOGxhcVhJU3lJOHp2YVF1YmthZTc0bmpPU0hwQVlSOGVoZW1panhF?=
 =?utf-8?B?bHY1KytRVGloSnhDWk9XQm1CS0ZOcEhaQnlOMnYxd1U0MFBhUzRianY4NWJW?=
 =?utf-8?B?NnVFOVJFbmJRZ080SG1PQU9heisxMHlraG5OdXRSV0ZUMkVtamJLdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35aa9711-bf57-424e-0d6e-08de5ca0f46a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 06:05:49.9744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uO/PiSeU4NtinOE3lheKiEl0mckfR+//2agG2q6J2fNhq/PGGjE6ExrJTXYm3xyEQVAoyUcS1Ocrc8x5bGe/WlRhHBgzvm5BVXdtt7DgW/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7337
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-5885-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[amlogic.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xianwei.zhao@amlogic.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:email,amlogic.com:email,amlogic.com:dkim,amlogic.com:mid]
X-Rspamd-Queue-Id: 3FF4D845FC
X-Rspamd-Action: no action


Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

On 2026/1/23 19:37, Sebastian Andrzej Siewior wrote:
> [ EXTERNAL EMAIL ]
> 
> Passing IRQF_ONESHOT ensures that the interrupt source is masked until
> the secondary (threaded) handler is done. If only a primary handler is
> used then the flag makes no sense because the interrupt can not fire
> (again) while its handler is running.
> The flag also disallows force-threading of the primary handler and the
> irq-core will warn about this.
> 
> Remove IRQF_ONESHOT from irqflags.
> 
> Cc: Yiting Deng <yiting.deng@amlogic.com>
> Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Fixes: c89ac9182ee29 ("rtc: support for the Amlogic on-chip RTC")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   drivers/rtc/rtc-amlogic-a4.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
> index 123fb372fc9fe..50938c35af36a 100644
> --- a/drivers/rtc/rtc-amlogic-a4.c
> +++ b/drivers/rtc/rtc-amlogic-a4.c
> @@ -369,7 +369,7 @@ static int aml_rtc_probe(struct platform_device *pdev)
>                  return PTR_ERR(rtc->rtc_dev);
> 
>          ret = devm_request_irq(dev, rtc->irq, aml_rtc_handler,
> -                              IRQF_ONESHOT, "aml-rtc alarm", rtc);
> +                              0, "aml-rtc alarm", rtc);
>          if (ret) {
>                  dev_err_probe(dev, ret, "IRQ%d request failed, ret = %d\n",
>                                rtc->irq, ret);
> --
> 2.51.0
> 

