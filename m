Return-Path: <linux-rtc+bounces-5500-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BE85FC97674
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Dec 2025 13:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A26F3345D2B
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Dec 2025 12:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B2A312835;
	Mon,  1 Dec 2025 12:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="kGh32OTQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022083.outbound.protection.outlook.com [52.101.66.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C822E30FC0D;
	Mon,  1 Dec 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593466; cv=fail; b=YZbTPBBJofMAyLSlqXFuC3Xm/i2Ekn/uoR/8FIU324K1uH9tJl/vm8Ko6SfNKN88OKh7dVzO/HKmMSe2R/mMtb9OaTqQfcI57BrcTA8eSplPdcHM22B5SDt0NZ6AuHrUdqIE4PrkGhJyX0cfdioC3MjoJHfnmO+ujznGPNxitl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593466; c=relaxed/simple;
	bh=Y+veERhI52/OsiKxxXUQwe7DeNg2u4plRSJfzPoeomg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mdUJW+yFH7LHvn6GmVTYJixuI+l5CteuHpptW5OQpSoMAcuejdWoU7y/ZlLcDi8O/v6ORA2UIhn+OxN/ty95thMvKhL1Oc402TRGAfqp6hWTkW00qC9D5kHWh8Xj5HgaD91pbdKBaT/LzUrmVhO1Xe9GVuS+M7xc6w3aRaorY/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=kGh32OTQ; arc=fail smtp.client-ip=52.101.66.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVa6Z27goPIpWn2W43wqwNUG4zKSrjvsUTvA4OY/U2dUxFk7zPPRbl2L3iZl7zzaXi4SC4WmTtNdVc0YLyscfpAfwW4eO9p7aeBKBZ5IQbXVfCV6e8yLvnFMgaaxy82f4to3I/GoozqNBiLLBp8owpkIXPXGzflLW5pXUq3UFs/3Qol7FREUwa0Q5HnOJSBEVo/jaeMFenfdcbgfmhoBGKIVkmLD08Y1mcI2q4eIdBX+T9vJiax0Zmh77r6xWuWNnkbtAQ6vSN0SjcmeyzFjzt6Dso4/pPNkcYzLIaYgYdRhw4aVEjWT1FLuHUxLizdIBqDc53S3XxgbmF5TBMyzAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qkt7TTfyF3XYxas6x2VQksWJvY77vO21rXl+rKQduE=;
 b=WPAYbhhA77DAumu+nTXfJ4F2sHcXQQSv9rq4GnaRFNKDx5hfYDFW5G4Mj3rEYW3BOvP25Tl7rAAsUwbf+iW/1xdhSOjAHPsD3tjoPytbHAna1ojjSaw5xaUyOpemHaFWfVqb1Et7my+ySLnbW+MWLOC7mIddJs1fSrwGC/Y6+7hM5KnzHwy3lnNfl/WxqP4A7yxT+TcrpY7VrqMmSAznI8i/+ShS/qtKAiG6qJzyMNFhYCf32fG1oPJUnWGN6JcrzU9qU94aX0E+AIMJScTjX00okRVsH3uYnhub3GPfHNeT6DGkz7gigGyzrbgM+fbMvuN4C96Ks3uzIE1qhBcQ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qkt7TTfyF3XYxas6x2VQksWJvY77vO21rXl+rKQduE=;
 b=kGh32OTQIpiaMCNILl2J2+FBnwlgUYRIHcbsvd6yXSluQZ/z/3d6Z1exQ7a96s/4cdd0mYFawpVPdef///Pw1UJ6pjKtRqg7kCF/BhfXv3wk2XiXd0NwUYy0tiG3CfhnmCh0LW+Nwf+xQ+31k0hvtFI8jwuHvwIvwpG8RqOElOBgoxMLsUi4fTubd0yYUdq22h/9kHLYUzGYffluUC3M8pJ0FnET8V4YAccUoWK7oxZzzDaHSiZqssgkpec3Aj0Ym0tob8T+1GW+KY5PN5kLVGcRWZg7CYIZmvYOY1lbSeRm3x/owJz8rSaAIuf0O+L4iskOIHN77nFGJuqbCXXs6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by DU4PR06MB10410.eurprd06.prod.outlook.com (2603:10a6:10:61d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:50:43 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:50:43 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Mon, 01 Dec 2025 12:50:29 +0000
Subject: [PATCH 4/4] rtc: zynqmp: use dynamic max and min offset ranges
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-zynqmp-rtc-updates-v1-4-33875c1e385b@vaisala.com>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
In-Reply-To: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593441; l=1357;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=Y+veERhI52/OsiKxxXUQwe7DeNg2u4plRSJfzPoeomg=;
 b=t8b8RPW8zEEqLFM895uTCWd4Ry/RtPp3xurIv9WhkWLN5Q3xxDBDKZMZny9YwKlo5+AqW6KzA
 dg0Q4wVnJf1BD9bnbiTBZr/GbJShkiiMA5rwVvWI62SfX3C9vfvWM9i
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
X-MS-Office365-Filtering-Correlation-Id: 9b507171-bb2b-465e-126a-08de30d83d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFlybG5HNkhlNk1sd3lVSkhLdnYxSUpNTm1BQ0tXTWZkc2xRU0c1SGpScEdL?=
 =?utf-8?B?R1ErcjltTnA2MjA0QnlMUGhMUDBnMXdDbGVORE8raVFvakRIUDlvV01xd2Vh?=
 =?utf-8?B?WEZrOTUrb3UwUUJOT2lwRlVOZ25ib01QanVoMXoyMUJMeEhsZkY4Y3ZyYytT?=
 =?utf-8?B?cVk0SVpxT2lIc3BSKzM2eEVnK3pnMy84d2JHd3IvSWtCYkdreFNJUlFneElx?=
 =?utf-8?B?RzBJQkFEcFcwOTViSURvYjE1MXdqR1F6bGpZSkh6NXkvaVdFYXpib3l2V3BH?=
 =?utf-8?B?UTBKUzgwTkFMdUtqR2J1YnFJSDdNeTFDK1NIQ2ZpcXpqZTJCMTdBSGxWeTE0?=
 =?utf-8?B?cXVHZzhpayt5S2dUK21qQndoeHdDVE9FSTAwSjRpaERFK3JmN2lENUJ5aU5U?=
 =?utf-8?B?bjdhc0hCVmU4ZGk2OERnSjRFYVlMODlsVW9jS1ZhSnhTMzdscDJ2Qi9YaGJE?=
 =?utf-8?B?eXZLZWJuaEh1R2NNR3ZsU01PWjB1Zlp0MWFRL1NTalhhaFZUaS83ZWU5MWhi?=
 =?utf-8?B?L0YzRGdiNXRJMTJRRWJVampQTitER29QVUFwM0xvT1pwTHI5ZzVTZWI4dUdq?=
 =?utf-8?B?N0hyN2tUMjRWNGd0cEZhc3JLemZDWFdhQTByWmRma1M5d3YzN0xIUUJocW5m?=
 =?utf-8?B?dFJTTWtaZnI3cWdWUnJFR2g5TU5VNUFUNWRhNStNT0s3RC9hZUQwdjhLeFdV?=
 =?utf-8?B?RE01Yk1vVjFUb1ZYbWJQcy9SSThiNjg5NzNOVy9hcUZGNjI2by9nVHRla1ZM?=
 =?utf-8?B?TStDQUJ2UWJaOFlnYTJaU0xicHNLbWorNSswUHY5OXFQRWhwWjEzRnRYYnVt?=
 =?utf-8?B?N0w5RHBsdi9qa3l4M0Y4UWFobmVwRDZ4SWo4OSt5L2k0WSs5Z3RJWnk3QTZF?=
 =?utf-8?B?U1JRYVdyellVUHZJaFlYV3UvaXRmY0kzbVNHSzRiSkx2UkN1dlhpemVKZG53?=
 =?utf-8?B?MStWZ2lpdk1kWVNBNlBkMmUzYzlOVDREaGpXZi9peHpDYk5CMy9tam1xTlU5?=
 =?utf-8?B?bkpaQ29OTUY5Ym5oMDV0RzdJSTdXVnFCd1JBY3F6WW03ckluUG1WRmdnbHFi?=
 =?utf-8?B?YW9xU3BZaFY5ODNRejMxaEppNmhiSzhzbVBXRms4YTJhT2Z3MENoM01jdEtK?=
 =?utf-8?B?Y0F0K0duV0F5aysvSG9sK0J2SkQ1RkZiVlUvQ0FZTmw1M05ldmxVenpqdGUx?=
 =?utf-8?B?dnB3OG1NM1dGTHV2NDlYRVlQSGl5N0pLVXlKOHNVSkpFUHZNaW1TdVExUVNs?=
 =?utf-8?B?cUEycUY1dkQ4QTYrNXg4MXp1eDcxM2k1d2tsajNUMklCTWtQaUpnTlpNVm5v?=
 =?utf-8?B?KytlZklCVEw5dldWSHR4UmMwZ3dWb2l1OHlLaU8xaE9jQ2h2UWlCMW1tajFU?=
 =?utf-8?B?Tm9ISTIwYXJ2WkdnaXRhRkkrNzJsSCttbWlYa2NNTU0xQ0VHOGRZQjNiSjB0?=
 =?utf-8?B?eFdrYnlqdXBoL3BMTFVrNExqa3cvRmFBTXpLbFBTNlB0OWlVN1Q4QzYrNlRP?=
 =?utf-8?B?OUd1MGNZZHZwWU9HOVVPV3RmL3NLNUsydXF4Z2o5VTAwSVVyL1cwallYMlk2?=
 =?utf-8?B?SFhaWnUzVmdLYkVDZ0ZYMTVVTkROZzBjemMyTmw3Sk02MEZjMFV2aWhDNEhn?=
 =?utf-8?B?UVFpMHFEdVJ6NU4zdVpkMGEyV0ZieXovdnNJOG1SdjYxR0NjSFdxNTZBQlNM?=
 =?utf-8?B?MzNJVUpMWnlha29JMVV4U0xNTTZDTWZLNUs1amMyRktDbXZGVjhQS1ZscjZ2?=
 =?utf-8?B?UHZ3TEo1RUw5T2ZhR0I4ZDJGRi9kd2FDYzFwMzQ2S215U3ArTkFOcUs3K2ZB?=
 =?utf-8?B?THROaEYwYUxOZEhRWFVibmJXZkFFNXcrQzYyZWdTVlFobE9jS2VMbFBnK2RQ?=
 =?utf-8?B?TW1ERkdEOW0wZWJGK0N5MTcxZTFKS21HR1pYTDkvZXlvN0xaTzNjTjRIV1FF?=
 =?utf-8?B?Rzl5Qjg2a0FxdmhIYnRxcHprUWxmbWpMdERFbUVkREVwaENrdFFZdGFyWHVT?=
 =?utf-8?B?M0hOQzBEYitZbkpjMVA0TXpoL3lOc0dnd2Y4Y1dSMW1HVGhXSEJqUCtzcVN6?=
 =?utf-8?Q?31DrWB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUM5cEZ0WXdpcUhoQ1RzeHFLQm1uampPVm0wZlJqTzBkSDB5UU9OTjBsQ29V?=
 =?utf-8?B?MTFpUmVjZjJDUUZ3ZGNLUy93ZkRGZG01Nm9EZjMrODdnNVdJdnF3TXJJOEw4?=
 =?utf-8?B?VzBUUzljd0ZYWHdvbHFEekVQcDBubVdONnBjb1p3M1k3M2N2Qmk0MURNeWg3?=
 =?utf-8?B?M1lpYkxZUFUzNDlSV2x1YzJDd2N0bkpNNGdtTjBoOGE1VlJtcW9PTVVJSmcw?=
 =?utf-8?B?d0JZOVJQam5BV3o3T0JxaDVZZ0tHRDFSVGlvc0oyYkZxTWI0SDZxaFBxbFhx?=
 =?utf-8?B?cFkyQnhtTDhQUUJDejU2SFFoS1RPZW9TYVlhTkdaOW5neEhFdVJkYUhVMEpy?=
 =?utf-8?B?bThnbnlRTzY3QVdCbFpPOGk1emExRlY1RHcrS3NyVWtScldHOGk1MUxHd2d1?=
 =?utf-8?B?d0lMK1ZtbDFmTFFvN2lvSm9iSHVSdU9nd3dTeERXMkFNTk1jSzlvWURoY2hS?=
 =?utf-8?B?bXVIZFZlNU4zY1pZTXBJM1hVekRPSFBZQkUrOC9qdTVRMTlWOXRVc3NHSEQw?=
 =?utf-8?B?SGNQM0tWK0hwTnFlVHgzWDUxWUM4TkR3OWxnSnRNbnlleUlodndRLy8vOUZQ?=
 =?utf-8?B?dGMrd3kyZC8yZk5XekxHZG1iMXpTNHhuc2JkNzRkOXJ1RFA2WGVrcEppL2Z2?=
 =?utf-8?B?RGUxYXVpMndIcERsUHFZd0hJMmRCTTNtQjI2K1hnbmZGaGJCWktPNnd4Y01I?=
 =?utf-8?B?ZDJvRUg1TkVVWW82RXRNc29tTVZsS1Jpb3JTaktwdkpBamFxLytuNDRJVDBV?=
 =?utf-8?B?VTF0SUtYSWFpOXozYmtXOWRlR2NiWFlLeTY4YXNzcGNBNDZLVTdZclNybXph?=
 =?utf-8?B?WnZVNWFqaGhIWFNDL3pJMmJOOWFwM1NGZjVVZnR1b25QcEV4S3dTdWpQTWZD?=
 =?utf-8?B?blc2aWNFZ2tnTEVVSmpKTlhOcWNEN08wZlVEUDZSOG5CZ3pYM3pIZEsyUXFQ?=
 =?utf-8?B?eWJLQVZnYnE4TWkyZTlUNllqU1dveUYweDZNWWQwclZzT1YwTElPMC9lUndN?=
 =?utf-8?B?K2FLd2cwK3RTYmR6ckF0N1JSaVlLSkQ3MlVnZURNVUlqcFh4UExKMmp2dVAw?=
 =?utf-8?B?a0JoSERRUUNENE1PRW0xSmtmV09HT0NONFY2SzNYSHM5ZXpkc3JXd0xETmI2?=
 =?utf-8?B?SUREanlOSVJFOXRlbUpqN0NianQzQ01aNnZpeGlTSnA0NTJQTTl3c01jcGJz?=
 =?utf-8?B?U1RKdWdFcTRReXBQYTRpYmpyNWRMYm90VER1SXB3VVB4Uis5Y213QUEyUlZP?=
 =?utf-8?B?bUV6Z0NwemxGLzlaTFJaNW5rN1VZaGk1Y1JWT3BzbVdoSEd1WFVkVHlMY1hH?=
 =?utf-8?B?UE9wSS9LRnlidGFQdkFzVGdReHA1Uk5uZUZFZVdGWmxsZVNMemY5TVg5WGt0?=
 =?utf-8?B?UXJxdEY1S3F5M0dYWEl6dGl6ditLdTdDUlNZRzZpdUZVZ205eVdEdHpKTEdO?=
 =?utf-8?B?VlE3MVFiNE5vTFZaYjFWMWs2R2duYWwyd2MxZCtNNlVrZkFDSWJnUDdRSUcy?=
 =?utf-8?B?cTFhTHhNTFEwUXloRW1saDZ6OU94TUd5UkM5RVBQOXM2M2ZqVU84QnZBNkdQ?=
 =?utf-8?B?R0RKSVlhUmdjWmMvVFJGRjZ2elVoMHNBZWpmQ3NpN1d5WHNyOUFHazBQcGhs?=
 =?utf-8?B?TWVpRURZaWRMQkNPRmFZd09hbTRwSW9HR01EZFYyVHp5Y0Ftd0hIeXUvT1FK?=
 =?utf-8?B?cU9hc0M2QUJsdmMxak01TTBMSXRpSlZZWDNWSFVmc0V5amdvOWt6OVF2N1pO?=
 =?utf-8?B?bTM4MXZmVXBKUHFHYUZRd0cvdnNpd2FEUFB1cGdzb1ZmblBBQVVhQmVkSXJl?=
 =?utf-8?B?Q3dkL2hrWm9IYkNZeE5FeUJIM280QW41aVJIQWc3SmZHdGVoREEvQUJlZWZh?=
 =?utf-8?B?aHBlSFVsTWlRVElWMjhTVnRETmo1VHp2MmI2RnlqV1QzQ1ZSVFBtbWpmSTQw?=
 =?utf-8?B?cW9Mcnlsd3Nsc1p1VHZSMkpTSzBDNUZlczdSVnlKVGlZTjVnZHNGN2xyYmk1?=
 =?utf-8?B?TjNCaVY0TEVzd2J4Q2l5d3ZDM1NuMG9DUEx3LzU0Z0hySlB1dU50cXpiZzBV?=
 =?utf-8?B?YmZSZEt1bGNPZXJjWGt0VC94QWxwUSs4bEx3b1dWdE94NHhqM2QyWGJac1dR?=
 =?utf-8?B?Ry9oZjZTL0o1c0dtUVh3WExHRFBpUFFtMzdIbndTQm5xR0FDRmlxbGFacTdX?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b507171-bb2b-465e-126a-08de30d83d58
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:50:43.4777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFGaAWaUR0yFqK6UHKNVR5maUyYZdTBoxDk2ctYRIVLh5YOuMavh5bHrlGmxe8M+5aEtLA9IcSA++qEvCKVKOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB10410

Maximum and minimum offsets in ppb that can be handled are dependent on
the rtc clock frequency and what can fit in the 16-bit register field.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 3bc8831ba2c4c4c701a49506b67ae6174f3ade3d..0cebc99b15a6de2440a60afc2bd1769eccfa84b3 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -44,8 +44,6 @@
 #define RTC_FR_MASK		0xF0000
 #define RTC_FR_MAX_TICKS	16
 #define RTC_PPB			1000000000LL
-#define RTC_MIN_OFFSET		-32768000
-#define RTC_MAX_OFFSET		32767000
 
 struct xlnx_rtc_dev {
 	struct rtc_device	*rtc;
@@ -215,12 +213,12 @@ static int xlnx_rtc_set_offset(struct device *dev, long offset)
 
 	/* ticks to reach RTC_PPB */
 	tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, xrtcdev->freq);
-	if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
-		return -ERANGE;
-
 	/* Number ticks for given offset */
 	max_tick = div_s64_rem(offset, tick_mult, &fract_offset);
 
+	if (freq + max_tick > RTC_TICK_MASK || (freq + max_tick < 1))
+		return -ERANGE;
+
 	/* Number fractional ticks for given offset */
 	if (fract_offset) {
 		/* round up here so we stay below a full tick */

-- 
2.47.3


