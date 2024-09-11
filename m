Return-Path: <linux-rtc+bounces-1928-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D3C974AD1
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 09:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E599DB21592
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 07:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2AA13A86C;
	Wed, 11 Sep 2024 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VAlazYil"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB37BAEC;
	Wed, 11 Sep 2024 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726038044; cv=fail; b=fIGpISVI1ptmttIiRI6XrftXIl+b00GPeWppqd6W7Innw4sDX408EOmFNQG4r/+btHqlSvUoxkXID35NWIbcTzCdK9hxuz3y6DChDOvtVH7WOuFIOtMEv7NFdwAY6wyEP+HxenljqPGIqlT5AaaHpfH1KED3adGmTJwoMpCNPII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726038044; c=relaxed/simple;
	bh=fWWrMDP1uAmFEszj1LKtpNXRy7xmSTDEU+SOeMfvx+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CcKXUGBJBDKZkFyCgohk5ktQ8TyJepZM+yr5yDP+JrJyw8L1W/w0ms4QkpDuOs3t5E8grTQwBL4JXr/CTY0RS4i0DEQLXU7ek1LfNmkicvtaD7rn4Dhf6gWvn3XHkcRcsmiuQjTDbVd09rJmDi1KeAY42abvZrfjctA5Y03w9tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VAlazYil; arc=fail smtp.client-ip=40.107.105.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4tUqV+2r3GjBIG+MvC/e5blZbp5Wp6mqhpPf7KSWlnViN7hdedDk03qJMMYpYNX17+1+oJGeoGfDm0Wpd6LgFaPdElM/AGesFeWZvE2pjuQimtLKhFT3ctAUEcxEvo/hAsze3v7a2ZPfFTgEC/v731V/yYdJ87IZFEI6ZAtAY331gDqImQqTyNoAffqhFxLBPiDrGbLqdX3UBoEU7Wy7LBlaZKXena1RONWpEMn08B2j7VTXYXivklEv8f/n8ACe2k+Fyuo71g3P0UZpyv12K1N0/tHWlwPXshchGjuxdDvaO553nPWCHMrvW75C9THBnJz6jKX26OSEK15w31RQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hsHTznEW7ngD/Pp6pcAyuu5w3h1g4FRD2BWlGhYwS4=;
 b=bZvr2qr5nGA3Ld/qadMCxlsVa9UY+x2YT4GUVX1FHxQZDqHJPvuaqC8Egt/RKm5b3oB3Ddgdb0OKKkInceLDVH9BBIDvYcfC4XsvQqZkh0c/uLSXyJNfqgRzsiI59h/tRVXjRvhSHRZyjIxYACx2iakU55TOZ5IHYrFmehEG/BRgyl3T4LlWrx90OHm7CL5tP+dOrIE7cqCl/OVvu4XUPozidUMk2woZRYHk0hvoeYWWeGTVGIGr7dI6yagrs3RQEwhTpLxTjoLyuKWLC/shrpLV2asdyQ5l5RxymO3holOUjKQvw/kwqv7uDfOQwCzFW27z+Ld7BVxlpil1+o5p7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hsHTznEW7ngD/Pp6pcAyuu5w3h1g4FRD2BWlGhYwS4=;
 b=VAlazYil9b4EmimCdxSFpZSdwm7yd1LjpHRhuMslrJnMjtd3jvk08Ncl3UQiwMoWSQn3zvz1eDDuv9Ioi5H7RcouGpKyUQ8bdNVnSJc0jZJ/v4gsBLqoL1F/Lz85VMUnn1OpcH9JaAaZMB6QCprNUlEEvgIpJ66gVYMy1xfYslUEUTiRO1kVm8id82slJ0MTBizFqwEFVYXCZWR3PKMCTQLmRNgM/p2WtGiFEASJG9jCsmn86mMQEuvdnWFxYhxDiORcUf81gKuodJBJsGxRgQhKw15w95JhORlZ14PB2Cfxm5/f2KDHRdTxoIsywKbuadDR12NXoFreA2IVOCmbwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS4PR04MB9507.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 07:00:37 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 07:00:37 +0000
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
	NXP S32 Linux Team <s32@nxp.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Date: Wed, 11 Sep 2024 10:00:25 +0300
Message-ID: <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0126.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::23) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS4PR04MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: b140c6a8-db97-43f3-0a48-08dcd22f6ff6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3lYczRSdXF6VUZmeUpHbUF0NFBZMk5VZUtnV3lNanRhbVhkREYwZUp3SExE?=
 =?utf-8?B?STFTNDFkbVJjVCtpTUpKL1dOMVFOMnVvKzQwT3F5M1YzTWhrOXd1NkxrQmVQ?=
 =?utf-8?B?dHhHWWswMEc3MC9CK1JleDZWNWZoSEFSazhKejRTVmJXWm9pWWRSS1JHUkNz?=
 =?utf-8?B?Rm9WRjE5RFc0N0JQclNYaGJPN21BM0dJSWNJL0JJeDFYWjZzR294TDNXTExx?=
 =?utf-8?B?dThHcGU3ellsVlRNbkF4Nmpva0dxeWc1ajlmNXRqYlhsaExLM3FaWjRLeXZK?=
 =?utf-8?B?ZUVKYktIY0RyTHlFZmlRU0JGWUFwOTlkY3NQWmpydUhxMHRuN3VCNjdiTlpI?=
 =?utf-8?B?cnQ0UUE1K0k4NThDM3FhS0RNc08rb1RkdmZER2I5WVJJRndPcmo0TG4zQU1X?=
 =?utf-8?B?VmZ6bXlDa2ZRSFNhbGJiV3pXSkRqV1lScmVZRFdpRi8rUUwxdGRDcDE0Z1hS?=
 =?utf-8?B?cmVzOXNwaXpOajZvb2JteHpBN2U3d3FUSXVsWVJrUnpkeXZ3OTREcUplNmkr?=
 =?utf-8?B?ZGtHdS84bzlQMWdwN2tvY250Mnc3YjRzVTM1bWtuYzlXSXc0ZVg5SDFZOVdW?=
 =?utf-8?B?aHVGeUJrbzlSOVhQcVlKSE5haDRUdlVvTHc5TWtha05CbU1pMFhaSUV0VjFx?=
 =?utf-8?B?eWlSczlNQU5ZNXptdUozNDdxNXNqZ2YrT0s4S2orV0t3OVJvbEwvTWc1TjNS?=
 =?utf-8?B?TTdIbVRaVkNFM2QxS2JDS0Q2akNPQnVlR3VYdGdVSW55SCtNbmZKMHhrNXA4?=
 =?utf-8?B?OVVHSGV1S2o5bHQ1OGVLS24vUmNzeWxob0YvWEsrOU94VzJtSExOdkNoT3dB?=
 =?utf-8?B?bkJyOXBnLzRCMnpkNWp3ZklDUm1Rd0dDbUs2MVdOZGZaWno1c1kxdHRueHEx?=
 =?utf-8?B?Wm9leEJmam1BelRSckU4ZWtzNU9HRVBYWFZxUUQwekZPaW1IeVJnNURMRGtk?=
 =?utf-8?B?eEJYRmlleGs0SktTTFJVdWdMVGgrazMrVUMxTWJlOXhzNjU3bjVmQlRVRE1T?=
 =?utf-8?B?VkJhYUdNZ3RSTzEvVEJ4cFdDbk8rTTVUdCtuc0xGbWNqcmtOSHM0SWdNa1lT?=
 =?utf-8?B?WWNaVkNlaE1WMk1sZFJ3L2JRUmNtMU9uL083ZzQzdmZaWHZEdGw0NFB3N0lN?=
 =?utf-8?B?SGhWM0pZYThvYU1EcFZic1VQVG1EVkFTK3o2WHl0QmJaVGRhM1NWQjZQTmVj?=
 =?utf-8?B?WmtnTHJ1TUc2eTBkRWlWRFR1SWJYRU1CSTZlRklCVEhjcklrb0VhcmxJMDZr?=
 =?utf-8?B?VTNjYjdkZjZLQy9MRWVpQnlqeHZaY2hpWC8venE4azdrMWZOZWkrWDRjeENr?=
 =?utf-8?B?eWd4WlAxbHMzUXRlMGtnNmNHQzRyWkJHcDdnMW11Z2Y0NE5wc1NqZ3lWaEti?=
 =?utf-8?B?bEM1alRjd1dWNU9FbVl0bGEzSlVjVktxT0ZQRDlBVUpTV1hCZkxldGtVL3F2?=
 =?utf-8?B?aENZZGpxUnBTR0F0RjRPcUN3QVp3dUh5d3Z2djVnT05xSCtXT1FVT2lmdHc0?=
 =?utf-8?B?SitCaEFiR2hQR2w4U0FKSklFeE83T2FSeVJ1SEh0TzJrbzJyeGJNSDhUR21k?=
 =?utf-8?B?NjFKVkRmN25wSlluc2lSUzI0djFwYkJ5NTZRU3ZucDQ0dFpRbnU1cWdpTERZ?=
 =?utf-8?B?UW9QVzFHUlRaMFFIajFVUHB5TVowTnk1ZjZ3SEhkd2txV0pCdXNBbmY4N1I3?=
 =?utf-8?B?WjBUY3NuUVJhQjhib0VRMTJ6d0UrL0VpUUtPeW5HaEdXdlBrL1d2SFUzL0c1?=
 =?utf-8?Q?M1dGzYBEptJst9YQgc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW9kRFhSeGN2RzAybzdVZ2NDcXlOUHAvVGRpU0Z6TitCNzlieldiN21iZTN6?=
 =?utf-8?B?dGlIWkRrQnJPTmU0WlB6TlVYbUE0YTFseXI2TzBYOW1teEN4Q2g4L09yRkJH?=
 =?utf-8?B?SGZSWkQxcnpnT2p3cjZWeUpxbTRQMTRHREFhU1BjWXRTZ2psR1FGNWVocTdo?=
 =?utf-8?B?Y3Q4RVp4MEhDQVg1c1ZDNVhzTkMvaUlhSG91K0Q2bkZ5SHFRSEVQcjdUMHky?=
 =?utf-8?B?WEVHbmZtb2IrK2xPQ3kzQ25PWnJCbEJqeHp0THNBUlJRYzBqMFRRcnNkbFhM?=
 =?utf-8?B?Q0NNYzNJZ0tqd08rWXgzY0pSaWk1K3hxUFRzMVBBTlNvaWx6dVhYTW9NSUdW?=
 =?utf-8?B?WHoxTy9IZitQbDVqd0FSUFp6ZklIV3dhOUI3MkNZZ0RjYko1QUllNm1VSE5u?=
 =?utf-8?B?WUpvTlFtS1V5N3pYeUdubUk3WXlFT2VTK1lxMEduakxtd2tLTEZnZy8yT01a?=
 =?utf-8?B?QTBRTXA1ODYrY2VLWlFUK2paaEwva1NCUS9BdWNnMWhEcHJmK1Nab2JKS05Z?=
 =?utf-8?B?S3YveS9WN0cxYTd2emtHMDRnMkpqeWpJQnlZczNwUFlsSFgyS2RHRnF6T3Qw?=
 =?utf-8?B?RURydHVabHRyazRjZDZXdFp6VEhvMlcwWnVBQ2Z0ZXp5eTl2TU1zNTcrRURP?=
 =?utf-8?B?YXlvZVVDaGdQMXNCZEhKQmN3VU1zeS94Rnh5ZEgyMXJNOTgxQWwzUTcvZHFJ?=
 =?utf-8?B?VE5KMzdUNERldkswNzFxc0JyMXlPNVlFVXFZdUoxNkNydnFGc0JSSnNMb3hD?=
 =?utf-8?B?Vy9vMUN4MysrcTVTajBMZDl3d1lxMUlGRWllNk5qc2ZkWDZkbnNDVytVWFVs?=
 =?utf-8?B?YmQ3WWlhN05lMENpRCt2WU5NZGhpWEROOW5vYmgzcWxqWjBtU1BqZTRmY1k0?=
 =?utf-8?B?MGhVTTJISzAwNnRmM3ZYaDhmQnFwaU8yWlc5OVlPS3NuRUo0eldWcCtma0xQ?=
 =?utf-8?B?ZENJT1dXcGRwRGZ1dHB0bFJYL3ZmWXN1emJ0T2xkWGFHVzM0M3BCbUpTU2Y1?=
 =?utf-8?B?eEZXMjR4enN5MzYycUZISkw0dDI1ZEhyZnlBenhsWmQwUG9DY24zTEJmQzll?=
 =?utf-8?B?cEJtemRTd201ZmgyRXlqZjh6aGxCMjZOY0RIZFp0NVRYakpSenIxTStEaHFk?=
 =?utf-8?B?eGtBdnpsbDFrVG0zWGpMbTU1UjZoNHhzWXFNaU1sMGZVL1dlSE5ZVXBRZSs4?=
 =?utf-8?B?YlBpTExXZjR6SWUwS2VJMzRMaFFuK3l0S3l6WStEcVVlNUx2Q3RDRFpFYVFo?=
 =?utf-8?B?eUV5TVFPN05VT21FU2RFM3UxQS9wczZhN2wxSE8zdTRuc2pvcjJxNDBYb1Vh?=
 =?utf-8?B?eVUvUnZqYnZvT2l3bHFWTmJMZU5na0R0S1RpVDY4dVJFbWoyWWZUcXFKdC94?=
 =?utf-8?B?ZkxGcVBuc0dzbkJtRFhuTVBZM2wrWkxWSTdkMUdEWU44eUlpUmFlaUJmZVpo?=
 =?utf-8?B?djlNdlhXZVFnTnpCaTQzemdKMzVTNmVtS0J3K1l0TDNlU3RTbGNQY1FaS0hX?=
 =?utf-8?B?dWpZSjAxMlRlakRsWTNQQTBRdkd1Vm00dmdqd2U0bGo4VS9kcGN6YzZNWFR4?=
 =?utf-8?B?TnFadi9BNzJrTXdwY2VXWFdjaEhxYjR0V0s1ZXcwWldyc0duT2pzSkEvSXdn?=
 =?utf-8?B?UzZxSUFML2U0bkg0VStHWjRNc1Z3Nkx5S3owdVo5Q05kblBCYXJTL3d1bFRv?=
 =?utf-8?B?dFNrTGlnOG9HREZLOGxYRU1qRmdRTkp1d2pjSmk5UUMyMjVMRGJvZHNEdjFs?=
 =?utf-8?B?Tm9kVExtUWhvSUhHMGMzdVFNYTJHcmxjUGlLOW5FV3hNK2JzWmRSTkQrbVR0?=
 =?utf-8?B?UGJSNUM0dkIxck5vb2ZjSzY3bkNjNnZLWkw1UFB1b3g0WndBczRwSEdsSmla?=
 =?utf-8?B?MWVCZk5DeFlQMEowN2FSOEZjdFhPVGg4NTNRbmVURjZhOGtzYVlzYUJ0TFFS?=
 =?utf-8?B?ZUs4emhxclJiZStzUEV2U2h5bzd1ckVBNlViODc1VlROTS96M2RtbG9HdFMv?=
 =?utf-8?B?NXVpeVBqeitWRmdYeTJPcDduRk15YjNMNytwU3FEejZqVDY0Smw5aUcwczVM?=
 =?utf-8?B?R1l4WTZSTG1uUzlEbW5VNVprRXVYVFRMMUgwTE5tdGlTQzVuc29EOHhvK3Q0?=
 =?utf-8?B?U2NTNjZUOFFZcVlMVnNDUWVVbzhtOGZkWVlpOEVudVZnM3pVRE1uTDF3NURQ?=
 =?utf-8?B?a2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b140c6a8-db97-43f3-0a48-08dcd22f6ff6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 07:00:36.8303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4HwW5lEw5Rr8r6Dqhz1UVnQzPPMfZQgHgwMhU6/7H4PLrK0Poq1kadpsuDolSJzoVmlqUW3lda2oK+NyeHvjuc0jNnHdHVFNXs7A1uFKXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9507

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.

Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
new file mode 100644
index 000000000000..8f78bce6470a
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2/S32G3 Real Time Clock (RTC)
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,s32g-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  nxp,clksel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Input clock selector. Choose between 0-SIRC and 2-FIRC.
+      The reason for these IDs not being consecutive is because
+      they are hardware coupled.
+    enum:
+      - 0  # SIRC
+      - 2  # FIRC
+
+  nxp,dividers:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      An array of two u32 elements, the former encoding DIV512,
+      the latter encoding DIV32. These are dividers that can be enabled
+      individually, or cascaded. Use 0 to disable the respective divider,
+      and 1 to enable it.
+    items:
+      - description: div512
+      - description: div32
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ipg
+      - const: sirc
+      - const: firc
+
+required:
+  - clock-names
+  - clocks
+  - compatible
+  - interrupts
+  - nxp,clksel
+  - nxp,dividers
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc0: rtc@40060000 {
+        compatible = "nxp,s32g-rtc";
+        reg = <0x40060000 0x1000>;
+        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 54>,
+                 <&clks 55>,
+                 <&clks 56>;
+        clock-names = "ipg", "sirc", "firc";
+        nxp,clksel = <2>;
+        nxp,dividers = <1 0>;
+    };
-- 
2.45.2


