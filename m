Return-Path: <linux-rtc+bounces-2673-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A6A9E679A
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 08:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC414285E5E
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 07:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738F61DDC35;
	Fri,  6 Dec 2024 07:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rBJ2C3zB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43DC1DD894;
	Fri,  6 Dec 2024 07:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733469013; cv=fail; b=sH/tjT6LOmmt5m4MSxrUORsrhxQERoRO4XHTKobgHdzI7u2t5Esq+TMx86awdPio34NoHDqmafIO1cgXKhYZf+bfPrVbDnqzD4SIGHMkgWmReca5yOU4bdkZwF6qUqdInje/xyz24xpapSBtRsuHVOn79IImGcq8Z6S8RhA4vPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733469013; c=relaxed/simple;
	bh=XyLduXwCdZxgo1D/t8dE9wvbrqHrx/v6TzeU1S6S/ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rVR+KUyoF1cZXb00QWA5ljXHXC0Zr+VNowxh3hU/CeaUURcb4n27/EGeLW5M3XH63MsigE2DF6KmWHOY2TYfZLCFcLLn6/3ue8K0dJy9Yo4KKtKMDRda+S+Nl5nULcZLQscrrJdCpOVOo8R5pRuQyGH+9dtMX7Kd7bGvLslxxYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rBJ2C3zB; arc=fail smtp.client-ip=40.107.22.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXBgY3qjmy3UODaM21riBhY5ZGcaLrk2ce/xjyGbKTf08Ir5kfccSlT5XtxF3FTOxMIOSuqcnlh9Q5+zqN/If2lbNP1S+TE4MTHE0ptt3AIwcraDmtxzLWczH8tVSy/l/GIk5cMRsX0okmzQB2RkiQ1Lo0FU8+EknAhvpJVhmda20Es6hBFPfmKnCnwGTar2ofvQftiUK7mW8MP6u3OSzDsJRMBumg94NsjEpnG9FPqfXt/bKoq3Pz5XYylm8bYSJZ34gGS6J/djDs+0dEuQFNCFj7joMF1PF+VCOFezPe5zJijVcs5g7D1U3OjCQV1hrj5gP+z2pNsZYj/vlyvV4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apYN15YTsL9Z97bWBv6JWjkGZMW4yQx4OhCXAAfPrOw=;
 b=yc2olaNPe8mFTvTj/0z6S+y/u5qiiRCtJ5jIjoL4NiE7fOOSd+/1Ceyd11rAB52ZEg2OwWp8iSUn/cQYkNTlMesFxy5H0eookTTTYrzZ/klinz7oHFgU5Uq/Ac67dJ41pyP7p5vMJCYNErS1iO/ncGklEytv2X+uQp00JD4IMtBZyv3awCFIi/RUQH+jTn0+eEDHQeCF2466DAgb16lz0KVqbvC5GvhmYM6Do9vBuhyskFFPj6GJwrJTV7iQbXJ9x2896CkhaQGB08kmYmy5MZ1WvuqiRSj0E/MOBAzHlz6BteCNPinhkirECS3AarI/PkL8VAU177QFSB+Sx6PhEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apYN15YTsL9Z97bWBv6JWjkGZMW4yQx4OhCXAAfPrOw=;
 b=rBJ2C3zB9b2mCHvJOsOsqBeFkTQBOw0y1TaXG+Ctg+tNKDNHl4PW+3NFJtd0yrlyioOTJeIMSfAuSJQrJdxL7Qdonp3sAOrC15RWTlmWVfI8Cn0j0+wDqaMpJfJt7UyQhzvOPFAmChC+UO2mPgDWxUCwprsnWD1uAwg7oftyifB+nBqiZHw22TOzZJJ5iIKIAWr1mcH87fIXxJ8/zdYa1vIxQ+L4do4JwNJ9ldBXMLiXAvh7+NgIA0NGwgDnIQDLyK5uyi7Pzd76SNSaa3ABmiZbWnfp2IgXcS5/ZBRZBTvZUGAlGjjt5tbxY6NCNi0y57Tld/qziPio7s43oDZhTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB9PR04MB9889.eurprd04.prod.outlook.com (2603:10a6:10:4ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.10; Fri, 6 Dec
 2024 07:10:03 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 07:10:03 +0000
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
Subject: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Date: Fri,  6 Dec 2024 09:09:53 +0200
Message-ID: <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0080.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::21) To DU0PR04MB9251.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 85dca25c-8428-4ca6-79a4-08dd15c5016b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1ZyOVEvcCtzQUZ5UVNkdmRTWjlCTWNIRUhWbmhobnJ0SVhNQ3BwVngyczJ6?=
 =?utf-8?B?ZTNxRXBxY1ptN3B0TTZJbDh2SkttdHdTblc1b2Q2ZzlGTmUvUmsxaStSakEx?=
 =?utf-8?B?ZGJOSVYzVktJWW1wYWxJVVl6RTJ1ZmJSL2ptdG84SFlQYnBZREJnaTRGM3pX?=
 =?utf-8?B?QU9NUDhzQVgvRFZWVnVRVlJjaW93cVNtQUxsQzJpU1BJQ3ZGNzZMcEk3M1dO?=
 =?utf-8?B?RlY4bDRic0RUTnRVYUQ0cXBITThSck12ZkFTbGM5NU5Ja1UwY3FnSHNjMCtp?=
 =?utf-8?B?L0ZUTVNRN0pqaDlVSE5wMlNTZWdwY1hYREU0NDk1SXoxZDY3RXBwVlh6MlRO?=
 =?utf-8?B?Smp6Qm4xU09HdUl1RlI5Y3RocW1yUnk5dTRIbXpiK2VlQ2lVMlRsdjB2MENi?=
 =?utf-8?B?ZlF0TW5tSFNPOE85ZXhyai9uazFST0ZUMjh6Vk56UVlBS1NoR1hhVHgzVWdP?=
 =?utf-8?B?NHlKT0hCakFtbFZvTHRTNi9DSnpHWUFTWmdXK3VJb0czUTZTYXkvdGdMK2NK?=
 =?utf-8?B?TzhYWDZzdXRaYTMvTFhxeTIyZHpVSU4yRGxXNGg1ZTFrQmd3RlBUdHljNkll?=
 =?utf-8?B?aFFEMGdaNUNVcE9pbzJOcWxFR2k5cEVKb2gxZkVER3hha0laMUxFSmJXYnFx?=
 =?utf-8?B?WmZEN1I2bitMbkN0VXdwWFdoeVlxQXhvY1dyb3pWUkdmUURxa3k4M1JDcDVv?=
 =?utf-8?B?My9Yd2pRdnVLaGp1eXlhM21QSWZrN1VTMGFUUVhvaXpjSTRETHVOOTVHcERV?=
 =?utf-8?B?K2I3TG9aOVF1Vm96c0UrMTNsY2RIVHN4OUZCRGRKSk9FeS80aktDLzZjZkFF?=
 =?utf-8?B?TktGc0EzWEp6M0x4MDVySlB3VE1IY0MxZTk4V2NuQXB2WEJoWmRpU0cyVzJm?=
 =?utf-8?B?OXZ2TVNaSkw1bVZLYUhXQkgreElWN3FaZTBvcGNITCtkVVQ2V0c4dXA5MWZt?=
 =?utf-8?B?TnJldmJ4cmVMb0dNTE03SFZMNS9lNVV0eXZ6SEtUTHZ6dlN4UXVXMDJsTzRy?=
 =?utf-8?B?Y1VSN1ZRdXUxRDJVQlNzZ21GM2ZUMmoyQWNHMWNmbEhTaHBaMzhoMGNjWkZq?=
 =?utf-8?B?bE5CWXhxVG9zOWtWV1QrK3BKUkIyT2svMTFDdHpsMFFYQ3k2KzkzM3RQQjV5?=
 =?utf-8?B?bExtbzNlczVIMWkvb3FCRzFQTm1QMVI0ZG0zczJOY1BFODUrU2JkUnBaektQ?=
 =?utf-8?B?M1VoV2JkTlJoWUpkeGFTSkczWWY4UmtXbWdaYWprRElFcEZZaGFuU215ZU8v?=
 =?utf-8?B?WjdZUlBDbzcyZU5zU1lQNTVBQmx5a05zb3pXUGJNSnJ2VXcwdFY2NnhYc0Jp?=
 =?utf-8?B?VXVWWE5OdHlEbWxFUGgvaWljalNINXpsOVZKemI5VG9CUTM5ak1SaXdodVE0?=
 =?utf-8?B?bXFvR0tnMGltZ2tvbEEreDVGSENLN2Q0QXVGeEwvdlNxWCtIR3FGSEtGVXg0?=
 =?utf-8?B?bXJqampLN3EreFhzd0ljcE1sSTcyQ2h2QXhzalg3TjRxQm1kT0pVZHhxcUNZ?=
 =?utf-8?B?a3VmMkRMbEw5a0R6elZSOHJZbVVDMktpSENZeTRaL2h5V2FuTkNFbFFLZ256?=
 =?utf-8?B?SG5LWkRkOEtXSHkzQTV5WW5XZWZmaVZCRzdpNGFlRnFOR0YxZmVTSzNiOThj?=
 =?utf-8?B?d0hKd21ZUXgyK3hlb1VCb1pkU1g3bEhkbEl6VmlTc3NnSlk0dUd6SmJXY0ky?=
 =?utf-8?B?d2lkSk5Jc2J1LzRJdmw0V2JMQ1dRNHFoeHVXdXBnbGtqTXAwc2JsYkRnQVhX?=
 =?utf-8?B?RGpVVWZzZWZNdE9vZkZabEhxNnRXSmJEbnYrb1BhRjVTRUlPUjNjUTQ0a0xQ?=
 =?utf-8?B?RGIvVXdxK2JMNW94V01vUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWNCN0k2dTNDelRxeHR6UGFWZStDUVNGTWdUK0ErV2IxQnl3K0JQVUQrTGl4?=
 =?utf-8?B?Njk0TittdnNXQVN1TzVZakxNcFFEa2RwMTFlMUFiaWxaMEJHWHlWQUFmRUI2?=
 =?utf-8?B?WUw0UUtPMGVydG9FL3d6ajFSbENndWhqNU5HcEVCNVVmdWw1b1hkZXhsbFlZ?=
 =?utf-8?B?YWlIWkRwSm9sVSs2cjF4MVdUNFZBRE0vQThnSkNJQzEwK2dqUlI4MVVtWmhR?=
 =?utf-8?B?ZVBFYUYxdVZUVFdENWFrQ0FQNWpla2h0YTQydldtYkZUUnNucXJWQ2hxTUhJ?=
 =?utf-8?B?UDdhYy9HZVJlK2FSQUxnaVNZRTVqWTRUNzFqS21VUHM5QXZMajBlYk56dks4?=
 =?utf-8?B?MlFCd1UybUVQWEFXNXNMQWdWRXlQQnV0RG9ValBpb1V3NmE2NW1ta3pUU0hv?=
 =?utf-8?B?clRSZzB3RDl3OVJQK01uWG0rMGpSODJPT2JMMjBFZmplN2paaWV6ZjczeVpU?=
 =?utf-8?B?ODdMN0ZlNzBPdUZ4UllvTXNJbWpOUC9TeFRhOExEVC9nWkNSSEV2MXdKQm45?=
 =?utf-8?B?d2JDdWpHeVFUYUVZSy9pMmhzWGZVeWRNSU12alhmWkQ4ckw1RGt4OW9NU2VB?=
 =?utf-8?B?SHlRZjl6QVpOWkJnRFBtWXpMeHY0N1U0Y2l6NnhYZU1lVFZENFJYSC9PamNH?=
 =?utf-8?B?YjAyaEVtYVRwMzhXSGZVZmZtcHI3Z3NYR0RvNXV2OU1uamk1VWZGR3dJSWlS?=
 =?utf-8?B?WUsxMUMvQU1OTklCRW91cjhsWGR0STgyRkZ6MUc2ZzlNYkR4TzgxV29LTmEv?=
 =?utf-8?B?MTlXc1VCd25JQ2pZTGR3cnVrSm81L1dIVkdqaitkSjJRck5ZcUxMZjlQeGFl?=
 =?utf-8?B?Y01CRndBODdWZjYvM2NnSzZMeGh4cEgzOHFleE9zeTY0OUNBREJwdGdDc25M?=
 =?utf-8?B?T2lMa2ZqUjRCcThsaXZBL2xmYXd6OE9laTRVTGZVeTIyaU1mclRnSjRSVVV6?=
 =?utf-8?B?K05mNmJsWGRSNHdwbEdkTzNmL2pSUUFHTjA1cGVwTHRKaEtsNE5YTGVTTXRQ?=
 =?utf-8?B?aUxPcEFtbTJjWTV4UXRwTlpDck53bFhxSWZ1REEzMVhIMU9USTliUTQvci8w?=
 =?utf-8?B?QlBGRkFFdDRMbVU0cmZVMmRrUTBlT01qRXNNQ2NIRGlGaUZRd3Z6OFdFNldZ?=
 =?utf-8?B?Y2ZFakg2NStQcXp3YTRoWU5hOXhzV2lHMlZTcXdtMTFWZTBpekZ2M09CQWJm?=
 =?utf-8?B?OWVMTHVoSHlzbktRWG9zYnZsQWhJNWpBeFgrUHhuRXgzVHZ1Y2pSRUNtUUxa?=
 =?utf-8?B?Si9mQVZyc3pMWDRIcDQwTU82M1ZHMVZiQitLazQrbmhIblhOK3UrVWJBTUhx?=
 =?utf-8?B?alBMaFJ5NHlUN3BmYlFWOXNHSkQ3RkswbkxRMFBXenBBVTlqbjVCTVpTaU5N?=
 =?utf-8?B?RGlTb2YvWDdXbEs1NVp4aWNlWFZkd3BvaEV3UEF6SmFkMWI4eWlBc2ZIU2Q5?=
 =?utf-8?B?YzRjb3NGNU1yTXVuRjc2TEhNd2M5ZlNaR0l3SE4zODg4VjFrKzBnTDNWYmFP?=
 =?utf-8?B?cGdxTm9XaUxyODN1Rnp3YW9vc0NXUjBMeitJcDhKRHZ4SUpUVVdUZlNydWpl?=
 =?utf-8?B?Y2NuMktuenU3OGNlZkdVNmtic1Q4ekg1SEtxNE5DRzUvdVczM3l1b255RUM1?=
 =?utf-8?B?MFRuS1NDa092OGtFZk80U2JiQ3dMcEUxNDBJeEtmRndBT2pOb0RlZzJWV0RB?=
 =?utf-8?B?VmdkNnZERnd2RU80aElWOHZib1Nhb3hqKzZiZTdzZWFTV2Z3NzNsNU5ZeElU?=
 =?utf-8?B?TzlMM0F6ZmRnaUJ6QVRpT1FndTE3QVFLZmIrMzZGU2g4M1NYLzFzeW5RaVNX?=
 =?utf-8?B?S3I1SGZubVl0d3VXSkhCU3JCOTNUbUdPL1U5TndCWjNpRGZwWnNKdkphQlpM?=
 =?utf-8?B?ZllDcGhxdWl6emRaUHJSVWdNdUNoNFl6bHllZk5ENzdzb3VlWXpmMkVEdjEw?=
 =?utf-8?B?OVhweXREUHNmWUlzckdjS1ZXZDdlVnBsMFl5RXU0TEVjR2R6ZGZKdXNCZ1dY?=
 =?utf-8?B?Wkw5NFRhazA1QlNHOGpZaVI2TXlJRWg2dUo2akpEQ2lzQzJIWnBxc014U3N1?=
 =?utf-8?B?SzdJUkloQ3kvOVI1cjBwbnBoWHJKY0ViRjA0c2FXSGFpS0c3aU5XdVFqMGhl?=
 =?utf-8?B?ckRmdGl0WjBtWlJFdjRDRGxQQnRIWk5TYUEzZktvQkhsUlNIS0VRci9NRnZk?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85dca25c-8428-4ca6-79a4-08dd15c5016b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 07:10:03.4677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Z1z5u4Sji1e0+epgOOsV+pKUkBu5uhFcocw79bMrGjkVQtdmXwvDU4S/5hbEhCFDASUfQ48EWuCWhIdNUTwdS2WY9h+oQsuxHAZpKdzaxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9889

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
 drivers/rtc/Kconfig    |  11 +
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-s32g.c | 529 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 541 insertions(+)
 create mode 100644 drivers/rtc/rtc-s32g.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index a60bcc791a48..25ee7c6d8748 100644
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
index 000000000000..0989b6f2a613
--- /dev/null
+++ b/drivers/rtc/rtc-s32g.c
@@ -0,0 +1,529 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+#define RTCC_OFFSET	0x4ul
+#define RTCS_OFFSET	0x8ul
+#define RTCCNT_OFFSET	0xCul
+#define APIVAL_OFFSET	0x10ul
+#define RTCVAL_OFFSET	0x14ul
+
+/* RTCC fields */
+#define RTCC_CNTEN				BIT(31)
+#define RTCC_RTCIE				BIT(30)
+#define RTCC_APIEN				BIT(15)
+#define RTCC_APIIE				BIT(14)
+#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
+#define RTCC_DIV512EN			BIT(11)
+#define RTCC_DIV32EN			BIT(10)
+
+/* RTCS fields */
+#define RTCS_RTCF		BIT(29)
+#define RTCS_INV_RTC		BIT(18)
+#define RTCS_APIF		BIT(13)
+
+#define RTCCNT_MAX_VAL		GENMASK(31, 0)
+#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
+
+#define RTC_CLK_MUX_SIZE	4
+
+/*
+ * S32G2 and S32G3 SoCs have RTC clock source1 reserved and
+ * should not be used.
+ */
+#define RTC_CLK_SRC1_RESERVED		BIT(1)
+
+enum {
+	DIV1 = 1,
+	DIV32 = 32,
+	DIV512 = 512,
+	DIV512_32 = 16384
+};
+
+static const char *rtc_clk_src[RTC_CLK_MUX_SIZE] = {
+	"source0",
+	"source1",
+	"source2",
+	"source3"
+};
+
+struct rtc_time_base {
+	s64 sec;
+	u64 cycles;
+	struct rtc_time tm;
+};
+
+struct rtc_priv {
+	struct rtc_device *rdev;
+	void __iomem *rtc_base;
+	struct clk *ipg;
+	struct clk *clk_src;
+	const struct rtc_soc_data *rtc_data;
+	struct rtc_time_base base;
+	u64 rtc_hz;
+	int irq;
+	int clk_src_idx;
+};
+
+struct rtc_soc_data {
+	u32 clk_div;
+	u32 reserved_clk_mask;
+};
+
+static const struct rtc_soc_data rtc_s32g2_data = {
+	.clk_div = DIV512,
+	.reserved_clk_mask = RTC_CLK_SRC1_RESERVED,
+};
+
+static u64 cycles_to_sec(u64 hz, u64 cycles)
+{
+	return div_u64(cycles, hz);
+}
+
+/**
+ * sec_to_rtcval - Convert a number of seconds to a value suitable for
+ * RTCVAL in our clock's
+ * current configuration.
+ * @priv: Pointer to the 'rtc_priv' structure
+ * @seconds: Number of seconds to convert
+ * @rtcval: The value to go into RTCVAL[RTCVAL]
+ *
+ * Return: 0 for success, -EINVAL if @seconds push the counter past the
+ *          32bit register range
+ */
+static int sec_to_rtcval(const struct rtc_priv *priv,
+			 unsigned long seconds, u32 *rtcval)
+{
+	u32 delta_cnt;
+
+	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, RTCCNT_MAX_VAL))
+		return -EINVAL;
+
+	/*
+	 * RTCCNT is read-only; we must return a value relative to the
+	 * current value of the counter (and hope we don't linger around
+	 * too much before we get to enable the interrupt)
+	 */
+	delta_cnt = seconds * priv->rtc_hz;
+	*rtcval = delta_cnt + ioread32(priv->rtc_base + RTCCNT_OFFSET);
+
+	return 0;
+}
+
+static irqreturn_t s32g_rtc_handler(int irq, void *dev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(dev);
+	u32 status;
+
+	status = ioread32(priv->rtc_base + RTCS_OFFSET);
+
+	if (status & RTCS_RTCF) {
+		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
+		iowrite32(status | RTCS_RTCF, priv->rtc_base + RTCS_OFFSET);
+		rtc_update_irq(priv->rdev, 1, RTC_AF);
+	}
+
+	if (status & RTCS_APIF) {
+		iowrite32(status | RTCS_APIF, priv->rtc_base + RTCS_OFFSET);
+		rtc_update_irq(priv->rdev, 1, RTC_PF);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
+				     u32 offset)
+{
+	u32 counter;
+
+	counter = ioread32(priv->rtc_base + offset);
+
+	if (counter < priv->base.cycles)
+		return -EINVAL;
+
+	counter -= priv->base.cycles;
+
+	return priv->base.sec + cycles_to_sec(priv->rtc_hz, counter);
+}
+
+static int s32g_rtc_read_time(struct device *dev,
+			      struct rtc_time *tm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	s64 sec;
+
+	sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
+	if (sec < 0)
+		return -EINVAL;
+
+	rtc_time64_to_tm(sec, tm);
+
+	return 0;
+}
+
+static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc, rtccnt, rtcval;
+	s64 sec;
+
+	sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
+	if (sec < 0)
+		return -EINVAL;
+
+	rtc_time64_to_tm(sec, &alrm->time);
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	alrm->enabled = sec && (rtcc & RTCC_RTCIE);
+
+	alrm->pending = 0;
+	if (alrm->enabled) {
+		rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+		rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
+
+		if (rtccnt < rtcval)
+			alrm->pending = 1;
+	}
+
+	return 0;
+}
+
+static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc;
+
+	if (!priv->irq)
+		return -EIO;
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	if (enabled)
+		rtcc |= RTCC_RTCIE;
+
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	struct rtc_time time_crt;
+	long long t_crt, t_alrm;
+	u32 rtcval, rtcs;
+	int ret = 0;
+
+	iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
+
+	t_alrm = rtc_tm_to_time64(&alrm->time);
+
+	/*
+	 * Assuming the alarm is being set relative to the same time
+	 * returned by our s32g_rtc_read_time callback
+	 */
+	ret = s32g_rtc_read_time(dev, &time_crt);
+	if (ret)
+		return ret;
+
+	t_crt = rtc_tm_to_time64(&time_crt);
+	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
+	if (ret) {
+		dev_warn(dev, "Alarm is set too far in the future\n");
+		return -ERANGE;
+	}
+
+	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+	if (ret)
+		return ret;
+
+	iowrite32(rtcval, priv->rtc_base + RTCVAL_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_time(struct device *dev,
+			     struct rtc_time *time)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+
+	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+	priv->base.sec = rtc_tm_to_time64(time);
+
+	return 0;
+}
+
+/*
+ * Disable the 32-bit free running counter.
+ * This allows Clock Source and Divisors selection
+ * to be performed without causing synchronization issues.
+ */
+static void s32g_rtc_disable(struct rtc_priv *priv)
+{
+	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc &= ~RTCC_CNTEN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static void s32g_rtc_enable(struct rtc_priv *priv)
+{
+	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc |= RTCC_CNTEN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int rtc_clk_src_setup(struct rtc_priv *priv)
+{
+	u32 rtcc = 0;
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
+	rtcc |= RTCC_RTCIE;
+	/*
+	 * Make sure the CNTEN is 0 before we configure
+	 * the clock source and dividers.
+	 */
+	s32g_rtc_disable(priv);
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+	s32g_rtc_enable(priv);
+
+	return 0;
+}
+
+static const struct rtc_class_ops rtc_ops = {
+	.read_time = s32g_rtc_read_time,
+	.set_time = s32g_rtc_set_time,
+	.read_alarm = s32g_rtc_read_alarm,
+	.set_alarm = s32g_rtc_set_alarm,
+	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
+};
+
+static int rtc_clk_dts_setup(struct rtc_priv *priv,
+			     struct device *dev)
+{
+	int i;
+
+	priv->ipg = devm_clk_get_enabled(dev, "ipg");
+	if (IS_ERR(priv->ipg))
+		return dev_err_probe(dev, PTR_ERR(priv->ipg),
+				"Failed to get 'ipg' clock\n");
+
+	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
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
+	int ret = 0;
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
+	priv->rtc_hz = clk_get_rate(priv->clk_src);
+	if (!priv->rtc_hz) {
+		dev_err(dev, "Failed to get RTC frequency\n");
+		ret = -EINVAL;
+		goto disable_rtc;
+	}
+
+	priv->rtc_hz /= priv->rtc_data->clk_div;
+
+	platform_set_drvdata(pdev, priv);
+	priv->rdev->ops = &rtc_ops;
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0) {
+		ret = priv->irq;
+		goto disable_rtc;
+	}
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
+static void s32g_enable_api_irq(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
+	u32 rtcc;
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	if (enabled)
+		rtcc |= api_irq;
+	else
+		rtcc &= ~api_irq;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int s32g_rtc_suspend(struct device *dev)
+{
+	struct rtc_priv *init_priv = dev_get_drvdata(dev);
+	struct rtc_priv priv;
+	long long base_sec;
+	u32 rtcval, rtccnt, offset;
+	int ret = 0;
+	u32 sec;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	/* Save last known timestamp */
+	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
+	if (ret)
+		return ret;
+
+	/*
+	 * Use a local copy of the RTC control block to
+	 * avoid restoring it on resume path.
+	 */
+	memcpy(&priv, init_priv, sizeof(priv));
+
+	rtccnt = ioread32(init_priv->rtc_base + RTCCNT_OFFSET);
+	rtcval = ioread32(init_priv->rtc_base + RTCVAL_OFFSET);
+	offset = rtcval - rtccnt;
+	sec = cycles_to_sec(init_priv->rtc_hz, offset);
+
+	/* Adjust for the number of seconds we'll be asleep */
+	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
+	base_sec += sec;
+	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
+
+	ret = sec_to_rtcval(&priv, sec, &rtcval);
+	if (ret) {
+		dev_warn(dev, "Alarm is too far in the future\n");
+		return -ERANGE;
+	}
+
+	s32g_enable_api_irq(dev, 1);
+	iowrite32(offset, priv.rtc_base + APIVAL_OFFSET);
+
+	return ret;
+}
+
+static int s32g_rtc_resume(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	/* Disable wake-up interrupts */
+	s32g_enable_api_irq(dev, 0);
+
+	ret = rtc_clk_src_setup(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
+	 * reapply the saved time settings.
+	 */
+	return s32g_rtc_set_time(dev, &priv->base.tm);
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


