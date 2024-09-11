Return-Path: <linux-rtc+bounces-1930-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1A974AD5
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 09:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05199288431
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 07:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E905413C8E2;
	Wed, 11 Sep 2024 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b5vdI6vs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013034.outbound.protection.outlook.com [52.101.67.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F186F13B58D;
	Wed, 11 Sep 2024 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726038047; cv=fail; b=XkA9D7PIPq61KF1Cu3p5ZxW4W+s8z2Y28NHdXko0sUOSwTDE4rpAbtDOIqDalbiIoxzRCOIc1QAolMfOMI1IztsE+A3hox+PVpOHCjj9ChV+RZbZ9C0mXa5uAcitkH1MWJrHb9a8II1mTxTaGscv3lLcbfGIb9Igu0tVzwVYPWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726038047; c=relaxed/simple;
	bh=GAfyXvVgT9HR8DxF+8NKoDPYH1hOMQEagTZ5gxNNlM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oE735+mqdIt+eJTzs+PjsmaLOyPSK9ZSCYqQ3TBw8QZf/dD9bDAVcqoACwCpiEcTX8qckIer2JJ3iRvufgqNCzmapEwUcZQV3akxXQB2r1bFwVv1wJzZeiKKbG/TnXGRmmrIpkIU45uZfvgCHRNmZDOzjUQ1C3OZV1lpPK0i9QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b5vdI6vs; arc=fail smtp.client-ip=52.101.67.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mt1iqjoS9U3DFjCCwPsjYzoowdojuC2e2RaULT+8zUP2lCUjN/AQgMOIO5t0vyHq6YRp/Zc9DRW/mPSsSf/TEzlUyM8WkmfBA/Y6/DK2rBjw48beHUMtdNZQaVYcfagWQqSOt+/owYnYDxDwhyOb8zjMBwlM+56++7CROXgyLDiRxrgfkBBxgYD0QAGbqBa2OhltByo+4aoXVpahPKfU/RI1PA7PpHfRgrc1+xGdDy7VmuomMNA+6LIR3JxtmHTvcHh5hFPS0Hb6LW4NxUDB+Gja/xnqK894GKGFYpZEDZ8GpiqHWBjlzqLqGRrm/wqQJn2NmXAEhI0XE3oyVhEnrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hw3u+ji/D6a3smRWsavQ9Tny1CLf4w11xJoaPdMow8=;
 b=av5q64YATam4EylGuKJyTyBabEfQs/tzRNoPvSS3mqgnPgj0DByYTNYzjhEVWpJ6VC3oYqwyLyb24Lfw/EsFdkQAN/sOUJdch4HuJ6kLA/Hud/54HR5RULcjMKw4j2dFuOfOvH2pQbCjBY6sF1mQxdCkiau23VQK6O/CIBdb2KiZxYOR3TH5YDwiS1blMhI6GEaWoAVeGYLHBaQP/Mvzq/IQYeqxkLoIahWQRgYWsjgJIqL9cBuyNwrTMRSse3ncSBsiplonaRRuR45cF/zbrM2Doc/31nk+PWqWa0l2DFllp2Ks8R85LyFKtovLlGpnkFYEsWe+JeKcZqGB/TSCug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hw3u+ji/D6a3smRWsavQ9Tny1CLf4w11xJoaPdMow8=;
 b=b5vdI6vsEbUGmNipdOr2b4ca53efFzebIn1mnDUVlUSI0Hl7DT8UEfoyCnGEU2w7kDSYD4H+XO0MzJGLwwtiLJQU4NNzkT9CihhtlJGsZkV0iWA/y2719dTfqZ3+TLdWMoF3izy/Tucp65ANYi02XLLmPOYZq5FbKcIwUPmJoIUQ932sqh76GtseLpPlPctyc0r+QmfAMo7IpjzjvtlpNSZhV+b7+DcCYtlA4xw5ZwKTpZ/HnG9EwX2xoznLdFPclntw4oV5JKX2xZ2cP9ojIm1cK4Y2/aZzv4qdJpFtI79l9I80FD83mLvftF1+68zXamZmP+f69wop2foXM4X14w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8286.eurprd04.prod.outlook.com (2603:10a6:102:1cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 07:00:42 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 07:00:42 +0000
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
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH 3/4] arm64: defconfig: add S32G RTC module support
Date: Wed, 11 Sep 2024 10:00:27 +0300
Message-ID: <20240911070028.127659-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0123.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::20) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf679b8-f979-4f0a-ec40-08dcd22f7341
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWgxQUFvMHNDNUFmUmZHVGl0YS84RnQzU2pCb0JObS9MWXFkdG94dnIzQXRR?=
 =?utf-8?B?RmtZb3BpdWFMNjUvMEE0Y2VWQXVJY3owRzZtejUzS1pkQ1VubEdWS1Q4SzFY?=
 =?utf-8?B?RVFsYUU1SjI1MkN5bjdwTkJFbFZvTWhTTVhtU2pqdTRQRHp5SFgwMTBwZHRq?=
 =?utf-8?B?UWJ6L3B4L1NKUS9GMEtUcGIrZ2djejlieFBXU00wY3RJRS95WmpINlAwVXM4?=
 =?utf-8?B?UmNTeGIweHRYdUZKbC9hdVRvbzVJK083VnhtMG96c2VIWnFFZ25ydVJGL3Ev?=
 =?utf-8?B?ZUR3VEFGSWdoRnd6V0oxQm9QRHlOc09iUXR0RUw5cm9aRTd0am5wUU1nVHN3?=
 =?utf-8?B?WUJybysxeU1GSWw2cUZveE5ZREZuRWJmaFVSUXM0YUhqSzl3ZHRIK3RKUmlY?=
 =?utf-8?B?SnNSRmZFMCs1b1RFa1BXMzZ6aExuVG1mVGhQNFJCb0h0U0FmRUlwWlJ5bU93?=
 =?utf-8?B?a05jWWlUNE1XajRrNGZ5QUlSSnVHWTNvUVovb3VIQlNnV2FqZGxMNjJ1aDA1?=
 =?utf-8?B?b21iQXgwT1hTdk5QWTBtUlZLVFgvMnhnd3EraVZNbDNCSlRzaUpuZVNrZDAv?=
 =?utf-8?B?K2hWZ3c3VWFRd0svZzlhdzhBYnlYajMwWk5GbjJ0ZWdEOHN4Y1JLLzAwNVhs?=
 =?utf-8?B?STd5L1FhTG91RFZxT0VFai9jbC9FRUNxdkpjaXE3NzRkVjhXQXNyekQyOXlj?=
 =?utf-8?B?N3F3WWZLTGxDWkNGYjE5dlhxdCtTRGx3SVJ1YzYvMUFDT3dJUVYwYkZ0cWVU?=
 =?utf-8?B?cklRckJCb0ZXMFVjUlVvbjFXeWJ6c2FHRlBlSlVNckFSdUNueE5hUzhXUWo2?=
 =?utf-8?B?RXlOTk1lTjFuc1BlMEpQbDY0Ty9MdnR2WEdCNTdwamNVd2hVNTE1dTFha3VD?=
 =?utf-8?B?ZnZTdnFwSmZLalpCTkcvT0lHSWdZLzRaRzFpdTZHMTIxRGtiVkc3NDhBR2Za?=
 =?utf-8?B?dHRKVTNHOG9VcjE4Y3JUTE9kendFa2JoTUx3Sk13NzIwcEFDamFaazk0Z1h3?=
 =?utf-8?B?ZjVza0dBRUVYME1uMDZkUyt6QjlTczdqNldqbXRpakNOWlJFREFzUzhvZHY5?=
 =?utf-8?B?R0t6ampicTc0TTlzWUorU2tHUzFZUDNBc3h1SExsWFVFNlNhQlBGK2ROaExO?=
 =?utf-8?B?T3RpeDFmYnpONFdkd1NPcElwTUlZVmhXV25pcUowVHk2MHhaWFRxMHRpVXdx?=
 =?utf-8?B?UFVGQW5Odkp2ai8zZmdFNEJIMEYrMFd0WWE4akVNdDI4QVlDOE1OZlpJbGFY?=
 =?utf-8?B?Ui9JWnV5aFhHd25UNUhRWWlRcWNYREgxWEh5ekRMSU5vQUkvaXNUbU9tNk5r?=
 =?utf-8?B?bjNtRlRGT1MyL2NTM1Vac1JrV0U3dWkzR3pwQ2sxcWRkU3BhVzBneWZtbWsz?=
 =?utf-8?B?Y08xTy9MZEh1SVZOeXhvL0xabmxFQkt4NUdwVUhpTUdVUVZHdDhhVWRHNVZk?=
 =?utf-8?B?cW5DcXg3bnd2M1RDQWJLa3gyWXIxRFN0T3I5QVNmQXNTYk1aa0JmVTBLUXJu?=
 =?utf-8?B?ZmtNajV4MzRGTjZ1NUh2S2YzaFNkamFEbUhqSlpsM3ZLY3ZCT052eXNHeXRj?=
 =?utf-8?B?ZWJzZ1REbXg3UkwrYXJoQ0JtYWFSWjVoN1o0NitiQkxDVW1TSjNSdU1BdXl3?=
 =?utf-8?B?WHVhdjh0cWdzRm81ZkR6aFZta3F4NllQUEZPUzhqb1FWNWh1WVVnOVpzRFpi?=
 =?utf-8?B?NmJpSStIUU9HZHJTd1MyRlRIQUNyRk5qbEV6eGFodVA1M3BTRDBrT1AxOHlT?=
 =?utf-8?B?cWNjNG8zb1ZUUXdZRmw5ODFyWjJjZlNzRVRNRE5DYis4cnpBWlYxbDZrL2lx?=
 =?utf-8?B?czc2OVhzVC9MRmpFQnpVZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmNIbEIrNW5WVll0c3ZCUDZZSEphMEE4OWZWWEg3UExWM2hqL2RSOWdnQXRG?=
 =?utf-8?B?L1g0czJXQ0tzS2pJMjFqZFZGQWhmWEJFT0htcHFHS0xEcEtjRGRqbS8rRGk3?=
 =?utf-8?B?SDhUNi91ekRGcFR5R2Nyem1TVVFORlhZMkhWWkx6ZWZyZlhSV2JzK2Y1VENq?=
 =?utf-8?B?eTJtZ0hXZDNINitxbkdFQ243MDRGN2lMOGprNThJZG9KYXhkdTFuendoYjFo?=
 =?utf-8?B?K1JLTURVRHE4eWlHOXF3Tlg3NXZhUzhsWTRQTGZnVTM2aTZHMzZzTkNTeXlt?=
 =?utf-8?B?cVlHc0VqL1oxQnNXYUxRVElNWURtUEtaTjJNbS9iRlptVmlzWk1FZDZzZ1Vo?=
 =?utf-8?B?ZU93cXlUUmFhcHZ0OXlkVXBUWWFIdGhaZFZHNFpsSUhCakNiYnFRVGhNR0pu?=
 =?utf-8?B?K3VGWi9MaVd1d1VFbm43ZTN2NGlPbVBDZmhyaVhRWWNaYnZhcmVBc01sMCtz?=
 =?utf-8?B?Smp2ZFlQT2MwRlZkMWZCN1prcEk4UHp1RDdhdDFXMEVSejJQRWNVK1dyMk0v?=
 =?utf-8?B?YjVRdE9idlpUbXlXSHJKeHJ6TzhvcjZMNThENmZKb25ScTFFaG91RTMzWEhU?=
 =?utf-8?B?WmNZdHZiRnhCNmUwZHFGcjgycUlycWYxaEMrRG93bkE2VnVJVHFUcXc4NzB5?=
 =?utf-8?B?UmNldHJUaFhyTzNzekc4eWdmQi81S0Y4RkhMRHRnM3ROaFBmTVFjK2l4RVVQ?=
 =?utf-8?B?dnM2cGdrbkdOcEkyaTNINjQyU0ZLMExHb1JlTUtGenVEV29jZzRuOG5HM0RC?=
 =?utf-8?B?T2hCRmRKZHA0M2ZkN3FsVnhWUDJib2ZGTU82aldoY21pUEpobUNwLy9rbDBt?=
 =?utf-8?B?c2hWRk04RDFRemFkbXdmMTltNmRtNUZrRG0vQUhJSmpobDhWV2hocnZQQXNS?=
 =?utf-8?B?OG9nd2hFSDgxL3p3VkpabDF6OHRpVlpTWGgzRGY2ZTh0SzNSVE9oRElpZDJl?=
 =?utf-8?B?Z0tMOGUwWTVzd2I5TEJXVWFMZCtZZHhCTWl2akpmZU9VNE1EUkdOS1dycUpX?=
 =?utf-8?B?UGIreWpGOTROUjI0WFdzeGtHdUhGelRyRm9RZ3BuZFRneFVGWjhlYVNHZnpt?=
 =?utf-8?B?Q2VlV1BnYmlFM3BVU24vVm1ENnNlUHluYTQ3bE40MmlUelZBQWtuYnkyOUQy?=
 =?utf-8?B?TnRrb2kveiszUFhBUGkxa1I4ZHFLYjROWS9nSURSczNlN3JlNEJEK0VFV3hs?=
 =?utf-8?B?QnQzNzU3NEE0NzZQWWd0WkRsakljVmRDMi93OU8vejNiT3VTTlRNazRrRTBk?=
 =?utf-8?B?TCtueTVSQU4wUllxWXp0RkdPUVRIZWYzeXdXWHRkaG96QWo2VEdtUktHbkNK?=
 =?utf-8?B?RUQ0RGN4UTJtZTV1RWdGYjRRcWZTYlh1T3BDclIrTmNGaHRLNE5ZaktvK2ZN?=
 =?utf-8?B?Um1iWG1aVkk3RE9LeFN5TElOU1ppbXhRcEVncW56dk5yVmVJbVk4eXB6OEZv?=
 =?utf-8?B?UzdxcG1xMDRzWHdQbTlvakY3aGZrUlZxdUFqWHBiNTNDeXN5N1JrSWVwaXB6?=
 =?utf-8?B?SHdTL2xHRWE1Z1pDVzhUSkdmaEl4Q2hMcFE4K0VKaDM0QVRyWHJIcG5wenpS?=
 =?utf-8?B?bnk2QXJHTk1NTEVCUFVkVi8wY28xU3YzbGNRdEhDWWowUEZsakhZVGpSeXY4?=
 =?utf-8?B?cjBGUXNPMzgxRkJmb00yS2IvZitRaFgwajJ1ZVBrUkQ5MXJXLytCZmJlRUNR?=
 =?utf-8?B?OGRCMmdFWHlrVUx0elZvRVVEYjYxNzZZTEZqL3VnQ3dDSWg5akQ4MkUreTBI?=
 =?utf-8?B?cWlYVmt3eDhCNVJzUjVBYXpKSjJzYlRIa3p4OXl3aU9VZytkVGNlektDWnRQ?=
 =?utf-8?B?bUZqWUZsa3BpcXhhZlllb245RkJ2VFZGcjZLYm5qdGR5anQxMUhtaEdDcUJ0?=
 =?utf-8?B?Tm55RU9FMHIvWWN2S0pXenVLblkxcC9UZjBaeDc3RWpWeHB4WGtCV1c1UXo3?=
 =?utf-8?B?cEdKcFV0T2tyRzE5VDIyMWxBQm9iVEJMbVJpMzFpcjA3RXJJUmFnTmsxbnBi?=
 =?utf-8?B?SkRqYmJCL0pWeDI4OWVHUmU4N1VWaUJCaFVhOG5ROG9BcVB3Vzl0b3c1VW01?=
 =?utf-8?B?YTZ6bEtGNzhxY1BJL0M1Y3NaN2pwTGVtaitZdDhMR0YwN3JkSTNGUzhjcVdT?=
 =?utf-8?B?M3ZZdTllTkRWQS9IdWpaZ0tYTFl2UTBFczg0K3g2QU03N1g5dktVejB6ZElq?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf679b8-f979-4f0a-ec40-08dcd22f7341
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 07:00:42.0714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIGrbuxMRz8UYiGwzAJ9a3UdZM9lP4NhlqpULq4v0ZWt1FWhbU7eEOSH+i676WsRxofYVW/l8xrnTzUR1UOFu83f/wLFMyOrPjRcDAkumBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8286

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch enables CONFIG_RTC_DRV_S32G as module by default.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7d32fca64996..5de9ae08294c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1198,6 +1198,7 @@ CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=y
 CONFIG_RTC_DRV_CROS_EC=y
 CONFIG_RTC_DRV_FSL_FTM_ALARM=m
+CONFIG_RTC_DRV_S32G=m
 CONFIG_RTC_DRV_S3C=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
-- 
2.45.2


