Return-Path: <linux-rtc+bounces-3122-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02741A2C906
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2025 17:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0587E3AA527
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2025 16:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9197A18DB20;
	Fri,  7 Feb 2025 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rs7MWndC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EBD192590;
	Fri,  7 Feb 2025 16:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946310; cv=fail; b=sX5DzUaGp92mnw7ayzNhgHfevRa7HqoT0vhqQf7av4gc+L74rUjs6SN+Ogc/8vKGuSMnjZDiKrOWIMwzXFvG8nbBOHP5Y4OC9ftY97PyKCUHUK1V8Xb0m+SN5d8A1r+ZwbttKu3aflChGllsHGH/3HlbR89t1jyBPkvlMpop63g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946310; c=relaxed/simple;
	bh=aIHjuhonVRUD/pSOu9kMVOZqdCit6NqK61OX4p7CevM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BzhVsigbI8Tr8Hgbp5le2i25R2bxCLGaekfny/H4M5CVYooG1OjZ1lIUxcSEHL95J1OrVuenkRb9gSyHKfqjBr+jvhygNAKAsTAcAGHK6PSjsDc0BxmCZBSGWUDMPTX+1pgp8DI/VMXNlGZkbXnyqIhXfzjZ64b7y/HXaQo3aQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rs7MWndC; arc=fail smtp.client-ip=40.107.21.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGkoZgXweJfTxbShsIUPTdxbybSXkmMdwHw6N3mEWSrKiXi65B+XVp8VbQI0vGA2ZMdbSqo3lxv9zaO+j3Wwdh5aZqwYYYZeZmNz/oXHE43YeR7t403pldh7cMmsnxctAjIwYdp7kGXGCIQrhlqTBgVD8+al/028DszCOKJoGuzDX2wVKE7InEPP9gMP5fytdkT8KZoiRc9GwltBAeVKvZsuUbd4UPwEXS9WamJ4LPGpPH5A9c8xSraMllHXZ79Dw1f2DR+ixe65g8BKGcSVTgYWD3UHjRCxCWvgwThdZMgp/wXYuvkfboURz23WCae2sEXkl+m5rHOgvPu1Zt8yMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1mmbX38yJLpeswxlVMjIMaVX8XEJ3y37DtGG2epC8Y=;
 b=POy7C+6o1WyrRrxbNOeZbKp0l9yZdUxDmbdJOlAy6StoysLmta37W4e266WvjL5Xhfb8RKID6HcBHF11YXy7GtVH4dt7uVWvyBFbHjPzog6tKhyXi3p4KsNo/tV++YMkLQ7Tm0Uq4z2SPH/4+dOtkjjN6yFzLnHvaPzDNihlzaa1MLWky5z4Otke2vdC5qxeikvHPbt2IKrxDXDH9o/4cKUU+5tj2ieWXmThPgBYidI/LNr6Kp7b9mncUS6B5/6At1FbXteg/gIUbjsR6SDBV9bLqxEH3ZtsS2BKHaH71at/WaVos7UYi0Ut4keYR2C60N3AB+96LuoPMre5fxNL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1mmbX38yJLpeswxlVMjIMaVX8XEJ3y37DtGG2epC8Y=;
 b=Rs7MWndCvIyuSHSZ2cISVDia5sAF9n7tFirB/yHJe45CisyFbTXeY6/Oa/RNPUAJEbFFhGhEFrTiFZN2BSGLR4yCDes718K2OWLBkJzbIOaBsuioMdzWk6pccc7JkMu8gRTWjqqo5FvT9kaFmJR5lLSmnNQpn1MPioK5i+y5dcYR0vw+jKROctW/jGiI4yWIFbfsASK4u/fSviF2pEs+bgNDlCM9ysgH/HTuXrbBrS22K7KWGwuN964rUM4LaY/OjIQu6enz63zs+468SjeJSQsBrKm2vgii8y4UikTn2RcS7+fyNBKlUuFLuNrOeV8Lfrscrh4UkhUBxQbFOBYyBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU4PR04MB10840.eurprd04.prod.outlook.com (2603:10a6:10:58a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 16:38:24 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 16:38:24 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: [PATCH v7 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Date: Fri,  7 Feb 2025 18:38:06 +0200
Message-ID: <20250207163808.1208552-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
References: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0084.eurprd03.prod.outlook.com
 (2603:10a6:208:69::25) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU4PR04MB10840:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca71d4a-4d7f-4850-c02a-08dd4795d715
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHEvZGREeFNCMysxdlpPRGhCRVhvN1l2VnlrS0pBbDQvdUJGYjRLbVhCWlpv?=
 =?utf-8?B?ZUJqLys0VnhYMG1JMEdES1g4SmhrMHM0ZmVZbVNTQTY2aVQwSlBHVHgvdGpl?=
 =?utf-8?B?dE9rRW1abklXbGFFbVU3Rms0Y2FhbXg2QlZtaWNzQitiMXhqOFdnK25nK0l6?=
 =?utf-8?B?RHk2eVJOdGZ3OVBSYlJSZTNUdGRUN3hySkcwTXUveG8zM2kvUHhKTndWUnFh?=
 =?utf-8?B?dUN6QzlWSitZc2RFMUo2WnpaeUg0Tit1cnlZMEsvNDNXbVlJbzd2NzVtZzVS?=
 =?utf-8?B?WE9yWGJnaFplTjRRY1VjRUVwUWtDbTRGWFhlZ2t1RnlyQW5NNUFBdHpQc2NU?=
 =?utf-8?B?SEFvd3h3c2o4Zmc1K0tpTDZJdHFlb1M0V25wVjdlOTIvQ1BUditHUUxubkNw?=
 =?utf-8?B?VlBvZ2pzYWZ2WVBoeHgrSEl6ZE5iUEprcXYvdWQ3MlNCR2ZMS1ZYb3hyMUJu?=
 =?utf-8?B?Y1ZQSFBxSGlPNVJBRDRYT1NTRU5pWlJndFk2dUVmTE9jcXNMWWs3NW55VzlG?=
 =?utf-8?B?WCsvbWRQOTU2b0xvM09IOWJObnRmMmJ5eDJkTCt2cDZYN2srcnFNTUE2bzNN?=
 =?utf-8?B?aXVJRXEyUHFFMmN5OUJoOWFpRlpEanZuWXN5bGN2ZExlSHNMeU5JY05ieWxS?=
 =?utf-8?B?a2R2UHhBMWdoTkplL0h4VFFLTE1kVUZNb0NJSFdrNVJEZiswbDB2OHVnL1Jy?=
 =?utf-8?B?QzZ4eG9wb05SMVRZWFl1eWxJa0I1VVVZdVdsL2pzQnRaa3J5Ti8zSlFaUmlV?=
 =?utf-8?B?aTY0eTdnbE8ydFFKc253VkZzYVRPenY5MXNDallXb3VVOUN0U1JXanZuTGJs?=
 =?utf-8?B?TzhVNzJkR01BV2lWa1pPYkJCdFp5cFZXWmhkWjB3UlBKTnZ4a1RMYTNVVHd2?=
 =?utf-8?B?dGZuTkdxaW14QjAxYndzUDlRSnVOOUVjOHJ2clVsK3lTcmhvcVYrS29LbjBz?=
 =?utf-8?B?bWc0RE1OWHN3UDVuUjJLbkNSWWtjK0I2RWhVNUh4SEdNTzNYOEVuaENmYWY0?=
 =?utf-8?B?aXU5Wm55N2pNdEZMTXdXMmdiUmJ2SVMxTk9nWjRiazZNUzZMOGdHaE9mK0h5?=
 =?utf-8?B?d2YzWWtoc0Z2NG9jd0dqMUovSUxNUlVUbEp4aEtYdWo3U1lVS1FlZS9FOUtX?=
 =?utf-8?B?d2lMRCthNTJORlM4VWNFa21aN1BPaXRSa0lnWVowdmV6WlIxaTNjS0xHN3BW?=
 =?utf-8?B?WTc2OUlOV3J4L2xKWjhDSE5KNk5zVW5XTWlseEVvZC95K0FHaUpMWDJWQTdQ?=
 =?utf-8?B?blJaNXlGa0p6Qi94ZnNJWE9PQW9tbGNtL1MrVXNrRk9JTlpqemh3SlQrY0tB?=
 =?utf-8?B?cmFydXFPUU5OOG5Jenlqc0tubTlhYWlUTVBkSkxLK0txNW1sTTAvb1FRcnJE?=
 =?utf-8?B?UGJFa3RHN21xTE1oTWkxT3hUR2gwd1JMY3V0R2FNbFR0VkZNZWF6a2NhT2xl?=
 =?utf-8?B?RHlkNDZPNG9Oc1FPQXZpTzZGS1Zzc2xkbFQ3ZzlYcDBTc1QybjlPZDZMVjZ0?=
 =?utf-8?B?M3lCZXMyNUlEMmJLYVFoT2c3Vm80Tis0d01JQUplaTNybDFGc0tqNElCQ3BT?=
 =?utf-8?B?WmN2bEFzNE0wMEtsTHN1YWtZaHBFTnErUHlMLzZPWEV5Yk9sQTkyWXdPeEdo?=
 =?utf-8?B?U1pUZzBFZHp0RWs3NWpTaG83TXNDK3l2NUJsMzFGUWlNbUxud0x4RkU5WXhw?=
 =?utf-8?B?RzVSQUVwNjFuM2FMTTlnVzk1ZVBqU0NUYnpkWXpkNW5jbmZMUlhoK3c2MFE2?=
 =?utf-8?B?UkVSM2UzekR6eVVGZWJxQ01hdW1menNKUVZDc2ZFNUl6b05jYWlncXJhNlNZ?=
 =?utf-8?B?NWZzVmc4TzN6UFlyeWEwRXZ4MUk1U2VvZmV0ZDIrRnJPNHk4UXhlSFhER2NZ?=
 =?utf-8?Q?oa7O01iXhbM6d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlVTaFFKNTBVcXlIT0VXU2NnNy95QTllSWZOMi9RNGtZc1J5d01GdUduK2xK?=
 =?utf-8?B?bUJkd3YzWG96L3lqZ0tTb2VGVk9VV3V1MHc1YmpxZ1FXdmFyRWtVMllWa1g2?=
 =?utf-8?B?M0tiTlJIWldoNi9NMm5PUzVjMG9hTFRWM2pKRGZZZ0dkTGhzbEh2djkrTllR?=
 =?utf-8?B?TVYySURWQVlCWDdDdlN6NzBreVc2R21BVG5NcU5FYTNwNGN1ZTluVGNnVzVm?=
 =?utf-8?B?eTFWc2Q0K3NIYUhvaEQzRGdBSUU3OGdJUnJrdDloZnV1Y1I4V0E2c1NnVDRp?=
 =?utf-8?B?QmZ4RUgxL2laaDkrc0VhMzlYQWtuSitNNURCRTJOMzhNbGlQOFdkZjNaRzZC?=
 =?utf-8?B?b3FpT3VzVVBzVXFZWWJ0V0gvN2xZQWRYTkdpV2JQTnNxSklTd2VVTDF2UjJ2?=
 =?utf-8?B?V2E1MS9FellEV3EzQ0JxL1R5VzFmSmNQOXFub2ZJaWFxOVJMS3lZUUhzNE1K?=
 =?utf-8?B?NGpGV3pNdkVFVUtBVXZvelNBb3lBcmlYOTZHdkk0WXk2dHVVNkNsVWZMTXRy?=
 =?utf-8?B?WjJvaFhHczAzOGpLZ3ZTWDJTNkc4dUJxSDJNd2pXbVNZNm11Zm9LT1FoeVdZ?=
 =?utf-8?B?VDZKOXBKNXk5czhhUEhMRDJHYXZtQ3diK0JlRTNvZFlMSW1CZy9XVjQyd0tq?=
 =?utf-8?B?UGdwMXhzdFQ1WmJsQW80NzN2NGpUY0tDTUMzdzlLNFBMNDlNRUNZbkRPVzVv?=
 =?utf-8?B?SkY3MUlBV095aEcxZklWblJYOEVuT1pWaTJhaldqVk0wTjBiY1JYYzFob05J?=
 =?utf-8?B?anBVYXdYQ2pEOUxQeFhVSWNvaEU4ZGR1UVZtS2tyeXJjZ2hDenZiVkQzRVN2?=
 =?utf-8?B?WjBpdlhUamI0NG83clYzUTBhekkrZXY3MjlkZjN4RTlRN0h6V1VJVlRTVEM4?=
 =?utf-8?B?eDVWemFkcnZjNWRwdnBYZy9zQ29rWmZKUWtyODJWMVdkcDB2T3RqUUE5UExs?=
 =?utf-8?B?WDhsQzJaenVaUmFGZUFoZXFWbGxCZUE4dmJ3NzJWaTBnSy8rZ0QvRW00aHg3?=
 =?utf-8?B?SHJaSWc2SlhKNHV6Q0NjbEN6ZFdIckczcy9YWGt0bTNlMEJzR1hkd2wrNXQ2?=
 =?utf-8?B?dTFRdUFsODBzUTdNZXlsWXpERFpmRDBGTVhkWVhHMmVoVU1zVXpuVVE4aGpW?=
 =?utf-8?B?TEdUcWtsQ05LZDhmTlBDUFdXNXVJSlFDczE0SFhEYTUxQ0tsVFhGdy83OHli?=
 =?utf-8?B?cWI4YkUwbFRSWStkVHJPSTBLU0lVZFI0ZGFWeHYxSlk0L1g0WkFYR3k2bXZ6?=
 =?utf-8?B?VGpVYnpKUWRKalJ2eFZENTdlTWRpTXFDSHNid3FjeWZ1VzBIcG1jeEVtRm56?=
 =?utf-8?B?ZHdMMXZhYUlHWXFzTyt0RkxxNVFrSlNwM05QQnhoay9JKys3bUhERnBPUDZP?=
 =?utf-8?B?eWd5YS9WYUpIV2RySFBDMTNpUXlRZ1Z5M0gxRU1oVHU2dGJYcVo3ci93REY0?=
 =?utf-8?B?NmtIRVlURUx1UmgwQThJQ2dUcHdwbjNzMEVDRmhJZUZCYUw5YkEwYjQ1WVlx?=
 =?utf-8?B?bUVyeUdLWVhzTGVGTE0yU0JKc3pLMnJWR3VBaStLZWV6N2ZUUjBwaVBOMWN2?=
 =?utf-8?B?OFdGOWhId1plRTdSZ0ZFYUlabDFkMVVvN0d4bnRUSHFxYlV2dWlwOHlvK1Jv?=
 =?utf-8?B?VVNIelVvc1E5UGpRQzR6YzNhRzJ1S2l0QndLd1ZUUGMyU2N2T3BaeE9UcExp?=
 =?utf-8?B?UEpYWGtYTEVxZ2d4bXR2aW1MNnlnVkg4aDFjS0JZb0o2Z1ptM2FwTnJJSWtM?=
 =?utf-8?B?a0R3SUx5bGxrUzRjRkpQT1JPcFpvRmd6VHQwd3R1YjJRSzg3QUV2OHJ2SDNV?=
 =?utf-8?B?ZGcwQ2w4cjhNVGd2eHFtMHVqZXFVejhTNEF5b2lOM0dHOGJRSmtrZEhqWWRK?=
 =?utf-8?B?K3RCZmg1Sm1GZ2ZYUE1naDJvd1RqOHhFNTBMUFFTdkpLVWhiWklxblZYdHNG?=
 =?utf-8?B?Q091SS9JV2l6dkxqOEF3R3IvWWNCRGY2ZDRCWjkvbmdpZCtMWlNvNXN1SjBP?=
 =?utf-8?B?WW5mZlFlNXBpNUtHSnkwcEp6RjNOeDlnWCtTWWhhTUk3M2dMU0ZQSnZ0M2hT?=
 =?utf-8?B?YWxZZCtYQ2dUcmJMOU9CT1dtM2RuT00wMVJXb2t3aVpFaTZ5Y2dYSmY3SjFi?=
 =?utf-8?B?UEZFaXpGemw1ZHpNaEZHd3Y0R0NXczI1TEVxUSthZUx2V3B0MXVBbFh6VHF6?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca71d4a-4d7f-4850-c02a-08dd4795d715
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 16:38:24.3226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KE9ke3v7LVYOJWccs4bHRnAjjj2YoVImSdJJhmvQY2jeUH0AnJh/pKCSQiIPLNuqN/8IQMo+tLtU36ArmHyc7UneV5UpCQMrrlq/OEKAjeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10840

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add a RTC driver for NXP S32G2/S32G3 SoCs.

RTC tracks clock time during system suspend. It can be a wakeup source
for the S32G2/S32G3 SoC based boards.

The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
alive during system reset.

Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/rtc/Kconfig    |  11 ++
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-s32g.c | 383 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 395 insertions(+)
 create mode 100644 drivers/rtc/rtc-s32g.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 0bbbf778ecfa..510dc2db745d 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
 	  This driver can also be built as a module. If so, the module
 	  will be called "rtc-amlogic-a4".
 
+config RTC_DRV_S32G
+	tristate "RTC driver for S32G2/S32G3 SoCs"
+	depends on ARCH_S32 || COMPILE_TEST
+	depends on COMMON_CLK
+	help
+	  Say yes to enable RTC driver for platforms based on the
+	  S32G2/S32G3 SoC family.
+
+	  This RTC module can be used as a wakeup source.
+	  Please note that it is not battery-powered.
+
 endif # RTC_CLASS
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 489b4ab07068..e4b616ecd5ce 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
 obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
 obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
 obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)	+= rtc-renesas-rtca3.o
+obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
 obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
 obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
 obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
new file mode 100644
index 000000000000..3244b23c533e
--- /dev/null
+++ b/drivers/rtc/rtc-s32g.c
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+#define RTCC_OFFSET	0x4ul
+#define RTCS_OFFSET	0x8ul
+#define APIVAL_OFFSET	0x10ul
+
+/* RTCC fields */
+#define RTCC_CNTEN				BIT(31)
+#define RTCC_APIEN				BIT(15)
+#define RTCC_APIIE				BIT(14)
+#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
+#define RTCC_DIV512EN			BIT(11)
+#define RTCC_DIV32EN			BIT(10)
+
+/* RTCS fields */
+#define RTCS_INV_API	BIT(17)
+#define RTCS_APIF		BIT(13)
+
+#define APIVAL_MAX_VAL		GENMASK(31, 0)
+#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
+
+/*
+ * S32G2 and S32G3 SoCs have RTC clock source1 reserved and
+ * should not be used.
+ */
+#define RTC_CLK_SRC1_RESERVED		BIT(1)
+
+/*
+ * S32G RTC module has a 512 value and a 32 value hardware frequency
+ * divisors (DIV512 and DIV32) which could be used to achieve higher
+ * counter ranges by lowering the RTC frequency.
+ */
+enum {
+	DIV1 = 1,
+	DIV32 = 32,
+	DIV512 = 512,
+	DIV512_32 = 16384
+};
+
+static const char *const rtc_clk_src[] = {
+	"source0",
+	"source1",
+	"source2",
+	"source3"
+};
+
+struct rtc_priv {
+	struct rtc_device *rdev;
+	void __iomem *rtc_base;
+	struct clk *ipg;
+	struct clk *clk_src;
+	const struct rtc_soc_data *rtc_data;
+	u64 rtc_hz;
+	time64_t sleep_sec;
+	int irq;
+	u32 clk_src_idx;
+};
+
+struct rtc_soc_data {
+	u32 clk_div;
+	u32 reserved_clk_mask;
+};
+
+static const struct rtc_soc_data rtc_s32g2_data = {
+	.clk_div = DIV512_32,
+	.reserved_clk_mask = RTC_CLK_SRC1_RESERVED,
+};
+
+static irqreturn_t s32g_rtc_handler(int irq, void *dev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(dev);
+	u32 status;
+
+	status = readl(priv->rtc_base + RTCS_OFFSET);
+
+	if (status & RTCS_APIF) {
+		writel(0x0, priv->rtc_base + APIVAL_OFFSET);
+		writel(status | RTCS_APIF, priv->rtc_base + RTCS_OFFSET);
+	}
+
+	rtc_update_irq(priv->rdev, 1, RTC_IRQF | RTC_AF);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * The function is not really getting time from the RTC since the S32G RTC
+ * has several limitations. Thus, to setup alarm use system time.
+ */
+static int s32g_rtc_read_time(struct device *dev,
+			      struct rtc_time *tm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	time64_t sec;
+
+	if (check_add_overflow(ktime_get_real_seconds(),
+			       priv->sleep_sec, &sec))
+		return -ERANGE;
+
+	rtc_time64_to_tm(sec, tm);
+
+	return 0;
+}
+
+static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc, rtcs;
+
+	rtcc = readl(priv->rtc_base + RTCC_OFFSET);
+	rtcs = readl(priv->rtc_base + RTCS_OFFSET);
+
+	alrm->enabled = rtcc & RTCC_APIIE;
+	if (alrm->enabled)
+		alrm->pending = !(rtcs & RTCS_APIF);
+
+	return 0;
+}
+
+static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc;
+
+	/* RTC API functionality is used both for triggering interrupts
+	 * and as a wakeup event. Hence it should always be enabled.
+	 */
+	rtcc = readl(priv->rtc_base + RTCC_OFFSET);
+	rtcc |= RTCC_APIEN | RTCC_APIIE;
+	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	unsigned long long cycles;
+	long long t_offset;
+	time64_t alrm_time;
+	u32 rtcs;
+	int ret;
+
+	alrm_time = rtc_tm_to_time64(&alrm->time);
+	t_offset = alrm_time - ktime_get_real_seconds() - priv->sleep_sec;
+	if (t_offset < 0)
+		return -ERANGE;
+
+	cycles = t_offset * priv->rtc_hz;
+	if (cycles > APIVAL_MAX_VAL)
+		return -ERANGE;
+
+	/* APIVAL could have been reset from the IRQ handler.
+	 * Hence, we wait in case there is a synchronization process.
+	 */
+	ret = read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+	if (ret)
+		return ret;
+
+	writel(cycles, priv->rtc_base + APIVAL_OFFSET);
+
+	return read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+}
+
+/*
+ * Disable the 32-bit free running counter.
+ * This allows Clock Source and Divisors selection
+ * to be performed without causing synchronization issues.
+ */
+static void s32g_rtc_disable(struct rtc_priv *priv)
+{
+	u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc &= ~RTCC_CNTEN;
+	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static void s32g_rtc_enable(struct rtc_priv *priv)
+{
+	u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc |= RTCC_CNTEN;
+	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int rtc_clk_src_setup(struct rtc_priv *priv)
+{
+	u32 rtcc;
+
+	if (priv->rtc_data->reserved_clk_mask & (1 << priv->clk_src_idx))
+		return -EOPNOTSUPP;
+
+	rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
+
+	switch (priv->rtc_data->clk_div) {
+	case DIV512_32:
+		rtcc |= RTCC_DIV512EN;
+		rtcc |= RTCC_DIV32EN;
+		break;
+	case DIV512:
+		rtcc |= RTCC_DIV512EN;
+		break;
+	case DIV32:
+		rtcc |= RTCC_DIV32EN;
+		break;
+	case DIV1:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rtcc |= RTCC_APIEN | RTCC_APIIE;
+	/*
+	 * Make sure the CNTEN is 0 before we configure
+	 * the clock source and dividers.
+	 */
+	s32g_rtc_disable(priv);
+	writel(rtcc, priv->rtc_base + RTCC_OFFSET);
+	s32g_rtc_enable(priv);
+
+	return 0;
+}
+
+static const struct rtc_class_ops rtc_ops = {
+	.read_time = s32g_rtc_read_time,
+	.read_alarm = s32g_rtc_read_alarm,
+	.set_alarm = s32g_rtc_set_alarm,
+	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
+};
+
+static int rtc_clk_dts_setup(struct rtc_priv *priv,
+			     struct device *dev)
+{
+	u32 i;
+
+	priv->ipg = devm_clk_get_enabled(dev, "ipg");
+	if (IS_ERR(priv->ipg))
+		return dev_err_probe(dev, PTR_ERR(priv->ipg),
+				"Failed to get 'ipg' clock\n");
+
+	for (i = 0; i < ARRAY_SIZE(rtc_clk_src); i++) {
+		priv->clk_src = devm_clk_get_enabled(dev, rtc_clk_src[i]);
+		if (!IS_ERR(priv->clk_src)) {
+			priv->clk_src_idx = i;
+			break;
+		}
+	}
+
+	if (IS_ERR(priv->clk_src))
+		return dev_err_probe(dev, PTR_ERR(priv->clk_src),
+				"Failed to get rtc module clock source\n");
+
+	return 0;
+}
+
+static int s32g_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtc_priv *priv;
+	unsigned long rtc_hz;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->rtc_data = of_device_get_match_data(dev);
+	if (!priv->rtc_data)
+		return -ENODEV;
+
+	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->rtc_base))
+		return PTR_ERR(priv->rtc_base);
+
+	device_init_wakeup(dev, true);
+
+	ret = rtc_clk_dts_setup(priv, dev);
+	if (ret)
+		return ret;
+
+	priv->rdev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(priv->rdev))
+		return PTR_ERR(priv->rdev);
+
+	ret = rtc_clk_src_setup(priv);
+	if (ret)
+		return ret;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0) {
+		ret = priv->irq;
+		goto disable_rtc;
+	}
+
+	rtc_hz = clk_get_rate(priv->clk_src);
+	if (!rtc_hz) {
+		dev_err(dev, "Failed to get RTC frequency\n");
+		ret = -EINVAL;
+		goto disable_rtc;
+	}
+
+	priv->rtc_hz = rtc_hz / priv->rtc_data->clk_div;
+	if (rtc_hz % priv->rtc_data->clk_div)
+		priv->rtc_hz++;
+
+	platform_set_drvdata(pdev, priv);
+	priv->rdev->ops = &rtc_ops;
+
+	ret = devm_request_irq(dev, priv->irq,
+			       s32g_rtc_handler, 0, dev_name(dev), pdev);
+	if (ret) {
+		dev_err(dev, "Request interrupt %d failed, error: %d\n",
+			priv->irq, ret);
+		goto disable_rtc;
+	}
+
+	ret = devm_rtc_register_device(priv->rdev);
+	if (ret)
+		goto disable_rtc;
+
+	return 0;
+
+disable_rtc:
+	s32g_rtc_disable(priv);
+	return ret;
+}
+
+static int s32g_rtc_suspend(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
+
+	/* RTC registers are being reset in suspend.
+	 * Thus store standby time.
+	 */
+	if (check_add_overflow(priv->sleep_sec, div64_u64(apival, priv->rtc_hz),
+			       &priv->sleep_sec)) {
+		dev_warn(dev, "Overflow on sleep cycles occurred. Resetting to 0.\n");
+		priv->sleep_sec = 0;
+	}
+
+	return 0;
+}
+
+static int s32g_rtc_resume(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+
+	return rtc_clk_src_setup(priv);
+}
+
+static const struct of_device_id rtc_dt_ids[] = {
+	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
+	{ /* sentinel */ },
+};
+
+static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
+			 s32g_rtc_suspend, s32g_rtc_resume);
+
+static struct platform_driver s32g_rtc_driver = {
+	.driver		= {
+		.name			= "s32g-rtc",
+		.pm				= pm_sleep_ptr(&s32g_rtc_pm_ops),
+		.of_match_table = rtc_dt_ids,
+	},
+	.probe		= s32g_rtc_probe,
+};
+module_platform_driver(s32g_rtc_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
+MODULE_LICENSE("GPL");
-- 
2.45.2


