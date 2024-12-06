Return-Path: <linux-rtc+bounces-2675-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75439E67A4
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 08:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72EE9285E72
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 07:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0181DFD8C;
	Fri,  6 Dec 2024 07:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XMy/rb1F"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0225C1DF252;
	Fri,  6 Dec 2024 07:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733469017; cv=fail; b=H/VHGuqRKy47vpNGWBhgTHW7UEv5S5FarEw1abG+eT/eNEkZ78iqiCHw9ZjynA2eXc29JpCLulfOlUXsxn07+9XpjXrHe3D5jQ/ZY+GxMUvQu3R383BrToiz4G6JedVejsjR2EdJmwYtTqb+5zLqW1jkWUNetFTie47AznU+3b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733469017; c=relaxed/simple;
	bh=ZAD/sA1tuA5FPYlCsrubxiXzo9TgAXVZ0WakUTQT9d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c2YJBxLIODKMhUCueiCZTZ68focwDdVvg04ojByHbjnFQkMJTadMD/i8m4TIBbpMKF8yBPfIfgXoLKS6pzoKrxGSeNzzlgiy+8FlpnxvBvzxjcNaQAQzyOsnZ0BVmoDcAtwvdoa+P+03CKFfDQjOnDBZyWwak1dyOmpFpINiNU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XMy/rb1F; arc=fail smtp.client-ip=40.107.22.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOvqt/AQFmTktt7WjIl/OWSM2tv4YpjdW1tFA2SALKNkloobjnH1/ZtBt0t2D03rr6DZaCCyD0VcsWC3mAXWexvwJIrj4BdaoPA/7tgPc4gkn8xQL9tzg9shCt7w1/2L6bjt02TapdKSPw3Bl03xJm6UbRbrjh/1tlyAOnzcSbrRZl1a8UvcaA0dnOsIR9a2ggELSuAhCAHh3/wQ6xF8hbmK5lNRxs+kTu1J6MnzKPfzELhjH9TCs5PlUuznfvbLgdyGKZ89B3vmjj6cuJr3cFKLLp+/BRl7szHHNqU4p1kUBgrfkHxh44YKHFq7UG0uQLbKhYKemNJR/dcFXy7tTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vP4HdZCU0bRlbbfurzpyr2e3JMGmSiL+Yyb27L5tfDw=;
 b=VhlVeXclFiQuyDY2y3eslqLUJueWOZPL8a/4ralbZ+rdoIZgBRShtIfFoK4R372o7XqkeLnZ+0r7zo7bqRAsLIZ3g1HzO0bISIYPu98f9MRgXaC7ul3yZ+HtFiBDqbCe6Oqb6+35IyrSQqxUsdbpIV6oYgTwyfV0y1zBgZIvrLbYuiZ8ZexWhYOYEbNBFIVUiGPS7nrpiV7XmPUHYzZUqsYhDfRKTvJiG2bKdLbdsJX1FxGc2am84ZmYEVWBvfeil+pTCa4jR3fqtDmo/imj7PHTQHJgg3RkbS7pVBTT8S+1OosxWvP+++sah/iwpoMQo09Alm5WnOFq/ZMaH5YOog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vP4HdZCU0bRlbbfurzpyr2e3JMGmSiL+Yyb27L5tfDw=;
 b=XMy/rb1FB401i1XfJbdoJoJb/A4i8eMt7L/xq073vB7dU1iyuctnuh+yOycHVKT7yoiB+rR6I8ajjme/7yv8QHQDWHQrIjbjKzFKhUFw8m9eTh026CZrFFT2zkLAYISa4nt7Y/KC5G2VYP2wI7ic3tamTS1YbPhmzcFkHy09YRxapZ+o7pW9ZDBdyGwe31DP4GyNRY+97HAtCri5ZZdHW05pnb/h2pMUqdd87lp+uTF4lqXVvIz5QMcH0oDSHhTQF07voPgxCAmDXTnsj6DaIG3+cbWBLcFaAhsA0MEnaYTeV5mEsbpznrLgfCuiWU0yh2rZ738W1rcotxdIUd0Kfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB9PR04MB9889.eurprd04.prod.outlook.com (2603:10a6:10:4ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.10; Fri, 6 Dec
 2024 07:10:07 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 07:10:07 +0000
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
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v6 4/4] MAINTAINERS: add NXP S32G RTC driver
Date: Fri,  6 Dec 2024 09:09:55 +0200
Message-ID: <20241206070955.1503412-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0088.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::29) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DB9PR04MB9889:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce519c4-4844-4aa0-d1de-08dd15c503ca
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2R3eUxpclA5OGloajgyM3VJcjRJVDBHVERjRWp6Vll0bnJ4OXNRNjNxWmNK?=
 =?utf-8?B?dnY5SGVDSVQ4Q1QzZUthcHh3aDlZcDJ0TlZoMjF5WU5mWkt5V0o4S3R3RDho?=
 =?utf-8?B?R2NBMkNFRGFQSEVnTk5TZjd2dmI2VlBiQllCbUJMQWJzUGRIbWVidlBRZGtv?=
 =?utf-8?B?R0l1dnB4emYvT2lKY0Z3SlNPUlAwL1M5a0ZZZUI0dUV4NWh6VzZadkNYeDlO?=
 =?utf-8?B?cGw2NDQxUnFXa2F5cDZiL1hVWEdBcnU0UUQ0TmtqNy8vK0l5bkVuNmNudFZJ?=
 =?utf-8?B?dU1xNmRsb3c5S3hRMWpzVDRHY0tLcnpoTTJSZzNkMDBBSkdjZ2ZPR1RvNW16?=
 =?utf-8?B?WE5OVkpQM1diejFBdTEvbzI4TVdaa2szU0VJZWJTM3hLYWNtaHZxSkxpVE9G?=
 =?utf-8?B?MlhlVmZKU3pOa0pGdXZTVmVaSDYzNHdid21Wa0ZDc2I3Q3JHd1lZc3hLVC9R?=
 =?utf-8?B?RGdMaSt3eGpRYW5KTnFTSzM2TzY0M3U3UlFkRmFjUW5Yd0o2elBxa0NqUWls?=
 =?utf-8?B?aTNxV05xenFuWE1LZXBBMXRiUlM5bXZZbnZHYkNZSlYwb0NlM0NBM3oxakpG?=
 =?utf-8?B?S1dMTWhCUmRGeVk3S21uOHBDNjZzTVFESWwvaWNCUVJIVCtEVCtsRmM5UVpl?=
 =?utf-8?B?a0hNbTVWRzd2WW5TNWpkdVVQOEVZNkp3blI3R3VwN2pBVjk5L3lIMmwyL282?=
 =?utf-8?B?ZkE2VGdnbXZsVEg4cFUydGJrUzJrbUFSM2Y3Ky8yRVJld3lqaEhsYVVySmpk?=
 =?utf-8?B?UmZ0NzNGNFA3bFRYZkJYOGxwczUzbThYd1Nid3dmdlh5dlRJTElWMGx1ZG0z?=
 =?utf-8?B?WlR2eWRhdmRNQU5rNjZGQXpxRE9IN1hybytmOVBmK3J2UGJ5ZlRQcVJlUDRV?=
 =?utf-8?B?ZCtYY3FBdWlNWXdmY0hjc1RmbDg4SThvTHB6MXRhN2E2MnUxVGQyMnVrK3NP?=
 =?utf-8?B?ZkQwQkNwWElYYURPWkxCV1g1c2hOdG5QVXJQRGFtK2dyM1JaemlTOCtsZjU0?=
 =?utf-8?B?WHdDUENpMjlpTTVpOTJUZ1Frczkwb1hXeVlEZ2h4Z1ZlN2RmNElaU2kvUS96?=
 =?utf-8?B?U3pwUmlJRzN1MVVOaTE5UnY3KzBVY2RSaDhXay9ZUGJaNGl6ekRXQ3lmZTI0?=
 =?utf-8?B?bkVTVEFhVGUvcjhBRkVoSnBzOUYvdG1uaEFDTzd5UmlYMUZnQjJFWGJaZXhF?=
 =?utf-8?B?WmNMK1BXWTMrRE5TWkNDNEFxbDAzKzQyZjBWTzJpTXp6R09IT1grZHI2YzFE?=
 =?utf-8?B?a1hhN1QvR2xCNEVQU1c2aFJXNE50WHhPWWNGaFk2eFY2VFRtS0FCODV2ZFEy?=
 =?utf-8?B?Z0tuNG9XQnliZjJkczhWaUQybTlsZ0JOdW9kcjhBYWtBWTdNcGVOeTFrREZp?=
 =?utf-8?B?TEMzcGFQa0hRTmZMVWNxMEQwQzRiZUlvWmlFRkZIVEpZRFJSSyt6TExDZFIz?=
 =?utf-8?B?ckpMSjhDM1RRM0hVNWFiSjhqQVR2M1RkNFJJdk9EalhQYUI1MUNaTVA1ZzhM?=
 =?utf-8?B?NU12WTBTTU95dEpmZm96Z1FqTXJaSDdtVVp3WVNNZHFFeXZrdlhFTnhuL0JV?=
 =?utf-8?B?VjV5T2R0Q2tqeFN5TmFJOUtKd1AzVUdYVkl3OXUzN1lZTk9nTGV3L3FnZEhr?=
 =?utf-8?B?RVB0Unp6K08rRlkzd2pZaW0yZUt3U1lpRmRkMjFQSUlLVzVjNGZ2WXNHTVUy?=
 =?utf-8?B?c2RIbjNLcXBDUVdxTjZRd0FVeHd0eXdHRHladUY3cFoyRVNUQTJ5NE9Qek5a?=
 =?utf-8?B?dDBlb1NaYjhjYXQrY1lpejk4cjFCL0hNdFdsY2Z4Skc0V0ZlOTlUT0pkTEgv?=
 =?utf-8?B?UUlxZXIrcWc0azhNY25ZZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1luSXpjRGkrY0I4YnFQaDFIejF6R1FETEsrZ1ZXcWxvc2FOVFRka1J2VzhU?=
 =?utf-8?B?dzZIa09wMVhNK09PQ2sxejBTdkJSSnBRczdxWXNmdDNGSThGZWJwZUh0SjY4?=
 =?utf-8?B?a2tRUWgrSFVJVk9uK2FTMWdmdk12M2lNMHIwZXZzTFc5V3pjQ0JBR1B3MXlk?=
 =?utf-8?B?WjlaWmgyVXZtajN0b3BkZm5TcTJBd2NhQ3hSZklXT0w3MmtWajU0SUlsaStR?=
 =?utf-8?B?ZXAyamYvTlA3YWQrQUFqYUNobVM4a05MaWVhanBWU2RWZFVVMS9jdW0vcUZ2?=
 =?utf-8?B?MzdZOUNYR0x4R1JMUi9EVzZQZUQwNFhiS2s5OS9TNTgxYkR0MitwYko2NEpY?=
 =?utf-8?B?WnNWMmdOLzRSeXhpeCtMUmNBNkJCOHJtbGpDVjRUVUNRa1ZUU2FCcU44cGFB?=
 =?utf-8?B?Y3JpS2lML2M4andYcjNrUk1aMGxuWmhKaS9taFN4Mi83WDRvYzhkaEZSdGN0?=
 =?utf-8?B?bG1CUS9MOU1BMGwxUUo0UVV6UnVTczBtYTI4ckU3UURWblpTVStrZ1huK1B4?=
 =?utf-8?B?M3IwMHNhVHlzbkROVmVWRXdSRllCVUZtbmNJRVpqS3hBQTE5L1Q4Y3VjMXBS?=
 =?utf-8?B?TEs1WFk2QzlQejJQQkt1Q1VuY3cyck1Wang1ZFM2QTFHZzJ6aGFxYU03Um5n?=
 =?utf-8?B?Zi95ZFRVc2F2RW9rYzl2ZFFzNjcxeDhtdFZrWWhMVjhwY091c3FMOHRsSGZa?=
 =?utf-8?B?MWdmKzRDZ2crbmk1V3ZVUzE5ei9DOUlseTFHNGNwOHpHMjYwNTVaSFo5akR0?=
 =?utf-8?B?dUg5QzFSZ09UdTdPVlAwYUh5cENEN1lqL1pjakJWbXk5TU8rbE1PMG9HbWhu?=
 =?utf-8?B?SDNkR0J0cEpSVERMODlLT3ZxYS93N05hVk1MRHB6RmZwOHdlaGlrRHFnZ1c5?=
 =?utf-8?B?VTJ4b2FkVEw0UHB3RDNLRms4SHRsNzJ5T05yU0tlQ2wxRit3S0pBR0RqR2cr?=
 =?utf-8?B?UEhZeHRHVHlOdU0yT1VINUpLNHp1WHFDNzJ4VXFSUmNDbm9YcHNIQTR1SmJC?=
 =?utf-8?B?ejhLeW1jQm5UbEVCVkczaGVRemgvVjdzblcrUlVrMmFINVBFY1p4T0x6anh4?=
 =?utf-8?B?ME1IamtQd2NpZjRBQTRjN1JWbWY4UEJ4T3pHUDBwZFlmMnNYMDliUnVWWkZo?=
 =?utf-8?B?RWRCMXlwUHM3UkcxT0NWSVU0emU5SUlWNWFzZ2N0Z1JrWFRCYTBQVGdFSnhN?=
 =?utf-8?B?b2NRYWFjbmtpS0NGbnN4WE0zUXRod25WZWVWSkdNNlRlajIyczZaQ3VrTi9o?=
 =?utf-8?B?dHUrTVJQazJoVzFqSjhwTThCb09HT3B3SnkzdFpQUkwvM3AxMExwdFRyb1Rn?=
 =?utf-8?B?Y0JsVDlnb1FZT2c5TG5FYkZVVlVibER2VHBnZkw5a2ZCcy9YL3ZKdDI2eWR4?=
 =?utf-8?B?RmJWQUEvNER3c1ZjWXl3ZUtVVWhQek5YUmtBbktydFRqTzlIeUFrYSsxajB6?=
 =?utf-8?B?dWd5SVVjS1VhazFSd3p2a1c0QkYyTFN4amVMckVvRzkxdTFlaWphQ0pkK3BF?=
 =?utf-8?B?M3dCa3EvcUVmeGJDVjhCVHhwbzB1Mmo1eFp2YlYrNUkwM2htbTY0OG1rVGZS?=
 =?utf-8?B?Z1ppY0pYRkNEMjFWZVFjRUNLU2thelFxWERiUURqR0pRYWFoV1pvbHNhdzR3?=
 =?utf-8?B?Yml6Zk45S2l6eVBTV0QyOUZOeU9EL2FNdFdCMGhtNDVVQzdLbzA3ZlB4V1M3?=
 =?utf-8?B?ZDIrcDE5SWxMZWxZbXh4ZXFVTDFSREFwSnZod0lSdDFwcW9mc1VQbmh1V3R0?=
 =?utf-8?B?aDhhWEphUkZXOFlsSnRsYU9ReHlJYk1XUnkrL25yUnM1L3NrVlIzMXdTcmE5?=
 =?utf-8?B?NUkwWG1yZzlMbjYyVmNvUlhua0xSMWtEVnBwenJJbCsrdUIrcFh3Y2N1VDVj?=
 =?utf-8?B?TExQc2hsT3hQbVArb0tqcVpybGJ5SGJSekM1KzdQRFkxUU1ja3JxVFA0T3ox?=
 =?utf-8?B?dU1BTUVFN29iZXJ4WFUrTS9od1lEWldlSWVXSFkrMTNlb1Q1NVFPTlhjNE1Z?=
 =?utf-8?B?bm56TkRkeU9Zb0VVa1J5T0EyRTZkM0pvcml6M096UU43blZQL09WTi9yaUFt?=
 =?utf-8?B?MjNxV1p3aWNvbVErU0FsSDBJeUFwZHdhTHRlMlJDaDNkd05ieWI1L21VUzUv?=
 =?utf-8?B?bEJZTlM1Y0FGaUYzVVBWaUlRYVJrOXlXT3NLbjRiUSswbTdGMGtYUlhPSjZo?=
 =?utf-8?B?bkE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce519c4-4844-4aa0-d1de-08dd15c503ca
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 07:10:07.3878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCFu7o9K+eVTG8Dxbz2PbVKCKzeJ3/NQQfNJ3MHEBUjGV3cCWg5VbohzU0Kf6k2ZIoPoGTqKSjyNVD004DdTTGRbnrW4xXLp7UYyGEM5GMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9889

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add the NXP S32G RTC driver as maintained so further patches on this
driver can be reviewed under this architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..cf1f5b0a31f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2833,8 +2833,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 L:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
+F:	drivers/rtc/rtc-s32g.c
 
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
-- 
2.45.2


