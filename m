Return-Path: <linux-rtc+bounces-3764-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D266BA7A117
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 12:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F32B1898579
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 10:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B992A24C096;
	Thu,  3 Apr 2025 10:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rxpv/0P4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2050.outbound.protection.outlook.com [40.107.249.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A2824C07A;
	Thu,  3 Apr 2025 10:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676452; cv=fail; b=UMUvBKNF92KBvE4WqKybod+FxnDHli7mFt/ZF9jzTaMZx8tbK9Iurc073z2b9voW4ORev0tpPUDHG1O8UICPtXRUyVp2OYHIfdmWEM4kt9DzeV5fjLlIwKgmOa3UFykvKWbiO/6Qjij933c+EzTGj6YDIn0C+HlUOdFqa8e2pyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676452; c=relaxed/simple;
	bh=MiLy6fWAXFgmN7SIgI5DtjximCyaaR4gvfG8iOL7Brg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H8ghdayoauvGSYnsDkngpZ5wfraQAe0N6pPSUQj39R7g4KBkcKvVWNO9N7obnoTzRr3bQo/4ObR00veyNuawBvchAi56uMp6vEcjir1J0NqH2+ZihsTYx8clGzQg88lGFcx9yMEDCGyDS7bEUaedub3aSGVuFmNz/U32+JOyP04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rxpv/0P4; arc=fail smtp.client-ip=40.107.249.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAw2aynFRKr1+uXPSKk14gKeEsRZgwvkODKBuMN7fhlkSpFmPgblmskyNFeQov1GEQYXACFBWrNVRa1Y+tBl0i/UMSuW2HebDAaxjkxLbVR5z6h4rb8i1nS3BXXclgci0XsU/TMV+Nzv2E5R9HyafoWchK24qpeU9Yp+wRzdkxNFQkaRXuiCNLF16h/NZRnsUXlme74+AhPxa2oL21taKggbby8XHeDPf49TIYmvBi6yhWrGpQMYqJLJDeYZP73twJ6HyWiYrpN9o8XNwUzBJH3yRfxIur8ooJ8Yd+0q/8ZJagZpsCJ3sImQD+PAnLRDnZf/2b0nq0Gmf3qc1b/qfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrvbbjDEfYI7M4Aepm5H409LTkOnMYEJPjIxD3CWMWo=;
 b=yOMIJu1ZSQIHiAlS2w6iO5azCgD859iKtFlIvy3M3vPzMgROGomhZE7y9yRWmwQohqCthBDuUYs2x3JwLQxOER8Y5Y7tNauhiM9FgAibDSz5/gJoJi1dDJARCB+5wbbDKfrRJO9ZZGw4A7xSkYbfbVMyBSenUlfhTL9gngWZ1YN/VVgV1DCBnlMkMuBvAD/jZprhoZcg6OBYUx66h12+FthjsVFn4us7OeHvsdQjAyksPUexh6u9ktiYUo46nRgkFSuq4Osqev1H+9QFO06/rz3SXRwFoeUJ3kyVjI4A/yGX4y8Bf+zVC4nvxKAE3YRTQhUBTnikDX/rLXBOHN9Kbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrvbbjDEfYI7M4Aepm5H409LTkOnMYEJPjIxD3CWMWo=;
 b=Rxpv/0P4n0WU32tQg75ZPt0Cb2B/7SfSfx0aZEWctAaQNq/lN8G7YMe0ZLtC4aeeG4DR3acWyZh9Wjv5o7l7N87J+DpOCXSY2cTbc0IfoM11TB/YjtsNobkknlaO058G+qc+/bxLg/sgckvqcjE84m9SNQTdvHA4iU2UegZFStzUNhQow1aGATBeVGarB2iGXrPs967UR5Scz47MjSzCKCKheTLd4Eqa1b1456VFImtP7wBE0iPZ46aYGJy29G6AOZBvYa6ZqezsLAqy2mA5cpzgEkrZdWnF1HqFOS1FviBQMRZYV8Smtqr92lFFKWeV9eqw8SdGVqrQ6wiMsGFQbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 10:33:59 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 10:33:59 +0000
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
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v9 4/4] MAINTAINERS: add NXP S32G RTC driver
Date: Thu,  3 Apr 2025 13:33:46 +0300
Message-ID: <20250403103346.3064895-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0022.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::32) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VE1PR04MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: cacf2890-ed3b-4bc0-7542-08dd729b0b96
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUN2MGJ3WnNWdStXTHZDdk1qWWNaUXN4QzhYVVdnTDdLaGE0OWkyTE8zSGxI?=
 =?utf-8?B?QXJHeXpjYThOdFVPSytVeSt6djJKWm1aYnZ4bVp1VExIYTdFcFhxVHpvNHl2?=
 =?utf-8?B?WFhVZWNzSXpKeUs5Ym5HOXVza25qV01DUnFjTk1sejY3WkZwY2dFck9Eakgr?=
 =?utf-8?B?eTliVUdJcDdaWGt6S1B2SVBzQUtJMDFNKzh2c2NKRkdkT0RFcEhyVllTSExP?=
 =?utf-8?B?Q0NKNmNtLzU4K2VtQ2J5SE1jeG1sRFpTT09KQnlFS3ZJbDdJRUN6T00vNk9z?=
 =?utf-8?B?M3hMcm5xMHV6eFN0ckhQUWs5c0R5U3RpL2JiTU5JZXFMMkZ2MThKaWhyazFw?=
 =?utf-8?B?a2N5QUtMTHMvai90YXZUWUpaYjJPVXovdHFoQ2ZVZ1Rqa0JwM1NjOXBlalRT?=
 =?utf-8?B?cGJoNmtCSDNZeWJhNVBEdGtYSjIrKzhoaXkwUnZGRUF0U2dVaW9yRWpkWWEv?=
 =?utf-8?B?NUJmN29PdTNVcE1WL29aY1ErbDJzWlZqS29zbE1pbVBnS2NiVGZSN05QS1VN?=
 =?utf-8?B?RURrTENiRTJsMEEwZ3FZaktDZk02T0tUOFMwVElZVkwrR1ZKNHlOY0lKY2Y2?=
 =?utf-8?B?dFlDVjN5VEJnU0VZZ3ZMRVQyR1lBM1lFWnl2bWNNY294K0tkclBXTEVHMHJW?=
 =?utf-8?B?SnNJaXlFWnNnUlNMUWpUc2xPR05OVm1vZHEwYlkvU2trSkJCVllDQ3JCaEs5?=
 =?utf-8?B?Y2x5ZGtjaU81M2FRMVRCZGhWQ3lTQThvdW81Vm1qeExvZ3BGa0IzOHNxY00v?=
 =?utf-8?B?aVA1MmlVSHYyNE94N1VySHl6SERaZDhzK0k1WlN2dFpUd2dmc1Y0dlROYmg0?=
 =?utf-8?B?a1hJam1mb2RUTGhlRFZKMW5TMXpsVTRVejNPcFpmTkdhSlRQZFM0Y09FVDZu?=
 =?utf-8?B?WXltcEhiNlBzOFRaSmp5ZnV2c3pFMVpCN2lZczBiQkgzeitBR2NaWGdNNm45?=
 =?utf-8?B?eVN5YjkyZ1pjaE0yUHVHTlBTZEd3eWFMd2xoTXJIMXJRV1BqMVhaL3BNTHI3?=
 =?utf-8?B?NVVUblZRekh0eWFjaUg2bmdGa1MxZjFKVFZhZ0FVWWpxMDVFbkt1M1RSVkRG?=
 =?utf-8?B?dUcxVWtWRmNCbUdjVDBrLzNCRkNDWTNjN3BnSXc3cUl3ZGxwZDgzWEUrNWY1?=
 =?utf-8?B?VXJTaytYQTZ3RXJEZjhHZUlYc3ZPWEdUWDdPQk9HU2p3VjNZWit5VTB1RVdK?=
 =?utf-8?B?ZGN2NUtra1RtbzMxUE1HNy95elN4T3RtalRSVmFWUVB3Q3ZibWZ0QTNJRktW?=
 =?utf-8?B?bWRTZ3FXa3pFSmJMc09rWURsYlhoTHFUYnBiOFhEYVB1K0hXR09vTGhRdTEw?=
 =?utf-8?B?RnZjL3dOREhTM3BVZXE4SEVOK2lXQjlEY0xydk5MM05XZUFtQ0IwMUpVcitx?=
 =?utf-8?B?K2ZpdmMwWXRqYWlONnluOWFKNnowZGVuNlJTcHhkb0tzN3NvZHdsZWd5YVR2?=
 =?utf-8?B?RW4yQk0rWkR3VDkyTWlCN2pjY0JYSU1NZjdlU05sYkxMZ09qc1MydThMK1pV?=
 =?utf-8?B?bXJhNjAwOXEvbGd2SW1CcEI3MHZrR1IraWt6QzdWR1BsMXM0OFdabnpvOFpa?=
 =?utf-8?B?ZHFBaW1pbE5HZTltWEd0dFdwQ2hzT28wOExFSVhhNTdQNzkzSXdtRnZYZjA2?=
 =?utf-8?B?QmlROEtsRUE5bENQRjBEc2J1eVdEbnRKMjNXcVdpZXZ4bzB5U2hZTlJsWnhh?=
 =?utf-8?B?bHNuc1FtNHFQRytkU0JHb3FmZUs3Z1JKZkRuWHd4MXhhSzFFN2lNaEVGN0l6?=
 =?utf-8?B?T3M4Z3ZsY21pdExzeGNtSGRKMFRYTFdIRzJ2ckZ1UHpuQXM5L2tTQ0pXR3oy?=
 =?utf-8?B?NzdFTjdySWEvSy9YSENqaWhGZDZSbnI3YmIzdG1za3VBOTJ5eVFlY09kaDdu?=
 =?utf-8?B?WWs4VTlnek4vMEVTandoSFBEUTdUcDBmZnhuZGx0cnoyQ2g3YnBoYnZmNUp1?=
 =?utf-8?Q?t7QG82X/5dM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2N4Q2d5MVJlKzdpNXlyNkdZaDk3bk95WTNpeU9IYk1KNmJJQUZCdTVReklo?=
 =?utf-8?B?Ulp5MHk3L2pnQmU3RGFwWmV5MkxwZWxLOS9zcmhVSkxzQmhoRjRwOGs0ME9x?=
 =?utf-8?B?VXB6WEp4KzVFalpTY1huem5ibm5qYlY4QnpNaGVjbERxY044a2xscE1ESGdL?=
 =?utf-8?B?Q3BCRTgwM2pCNFk1ZUYzSHRwZ3dQMGNDZEpGUGpxRWxXTWF3V0x4R21vTjR0?=
 =?utf-8?B?NjdtNTRaa1kreGUwYng3aFlDWGQ1SVM1NGdKaURTV0dOYXBIZzVYNkpkTTBM?=
 =?utf-8?B?ZCsxcWIzY0pCTWVXQ1dSNG1NN2FHakRSb1dJVCt6U2pGZmhBenJaOTYvY0Zx?=
 =?utf-8?B?QWZvQ3pXOW1DejJWbWRodWZYSXZ0RlV1dzU3RmtkOGZ0Nm1jMm5rb3VZWXIy?=
 =?utf-8?B?SHlNbEZVZHhOZ0RhblMxRlFDeWhHRzZBWkd4cUtXdlBDeDJpSHM5aTZYdXVW?=
 =?utf-8?B?RWlrblZGSU1mdm9jZ2p4T0QyQmF2UDRPM0Nkb0kzd0pzcnkrQUFhNmd1clln?=
 =?utf-8?B?T0drdlExbllsVGZQVUhsWGFBa2VuTjlmY2lsZkcyVjYwVXRPc2FFU3QwVnNz?=
 =?utf-8?B?SS8vczdOdFhKV0w0b0IzcDAwaURCeHBWNEJhUW4xUGRweU10WkprUDhkblVp?=
 =?utf-8?B?aEptZ2gzMFN4Q09hcndEMGc5eG9VOFY2amJDb3RsbnVFWFBvY05tYUxMd3VZ?=
 =?utf-8?B?dCsxRVltV0t3Q1FnRExXRDVBUSswRnBhYzJPTWVsR3lwSERKdXhUY0haWGxu?=
 =?utf-8?B?SEJBNHYzWHFLK3crQ2RUd2NRU1dDYzZWLy8wcWdPWG50OTRLbSs2QnVReXA4?=
 =?utf-8?B?dGQ5TE10c3NmSnU4MzlRSCtwaW9VWUIxNkVFQ0hBZHo2bVpFcjZ0Z2gyNHgx?=
 =?utf-8?B?VVJNZUVZelNURHhaOHFqdnZzTmtVTElValViSWtsUEVhQUdQQlZ6YzduMFpr?=
 =?utf-8?B?QlNqVFBNdzRGSVBrRDFGdXZ0R2UzbXBZbmhFYmxNZ2d4K2Q5aXo1N1FiVSsy?=
 =?utf-8?B?Qmp4R2xiclpGdUd2V3gvakt1NHdIS0RaL0dvRHgxTWlaenZLWnc0eE9mRFc1?=
 =?utf-8?B?RHEzTGhBbmZDbm55Ukh4UVo2U1JJZWJ5THBxc3JBTVJBbEViUVhScFpIeVZv?=
 =?utf-8?B?ZTFrZGlaeDhRYUZFMkVveEpqYkhWc0F1a3g5aGlFMTlkNkl3Nk1lQVlPYlZs?=
 =?utf-8?B?Zit6SDFSWURPVlJnai85TW9sTFBNWTJXaE5TcVBOUVpZQ1RzNk1walpyd1Fy?=
 =?utf-8?B?dmFwNldWYmt5NXh1Uk1iWWNHa3JIcmVJL2x6cW9zQ3EwS2d4K2Y4YWtVMVF1?=
 =?utf-8?B?VXhoVGRXSndQeWFVK2xzTkJISGhBamlhVC9PMWcxR3ZHWU5hNThCQ3pXb2Nh?=
 =?utf-8?B?L3hlN1RQSllFcnQ3dTlPTnRiWThNKzkzb3JpN1pjRVFkR1hWWTM4aWc1RTlK?=
 =?utf-8?B?ME9VMEdmTDl2aDZTeTJxQ3pBbHZ3Nmp2SndFTVh4UG1wenhaZCsrclVMN3NC?=
 =?utf-8?B?a09iRWQwZXpYM0ZFUURTL0pwSk9oRkNJNUZKMURGTUxVc1lLR01NbzdXU2Jq?=
 =?utf-8?B?djVRWFNsbnRLQ3V5b0hodHA3cVV6cXJTTStOUzRad3BEczhmZW5GL3U4K1p2?=
 =?utf-8?B?cENiV2JyWG92MXh2b2x3bG10QTNEOFhaWGF4Wm4wYnJxdlp5WTFlL3ByVE1q?=
 =?utf-8?B?bXZBN1JZT0xuSzQvL2lBMEhMckdQVTAzQndqUGNmMlB5alU5SjhPd245ZzdW?=
 =?utf-8?B?OHVUMCt4MUx4Nm43ZkYycFBRMVBFYUlMMVFWdlgwY1ZzZlV5dHVGSDUyeTFn?=
 =?utf-8?B?L0pSUkdsRUQrRzZRd3YvTjVtbFVLU28zUXd4UWVRb0lqNTdjdXFZdzdydnAy?=
 =?utf-8?B?TkkvKzZscWZXUHNGVHZTZzR5Mzk5WHJmWnF5NkVlT0VUMkFLdkRXaHUyY1Nh?=
 =?utf-8?B?Sjllcmwvc0lnYTlYSnZuSEJGTHF2OG9sZy9VeXhZNTdYaW5CTGg3QUJlV0ZQ?=
 =?utf-8?B?d3hnd0ZScVBGTmlyU0Z0dWVrQkozMTVRZUFsMXhJQVp4akhYMzk1d0N1M1py?=
 =?utf-8?B?NWVFWmgxVlR1TGJrNTFxT24yNVNSR2lqN0ZJZUJWcVAzRzI4alI2MmxZUzVO?=
 =?utf-8?B?cUNDL1NQbGR4MnNCRXYwcGdMWWVsekNjUHdBYUhTZXpzM082Uk1wSENwdlBP?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cacf2890-ed3b-4bc0-7542-08dd729b0b96
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 10:33:59.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KegMNUCA6PzSbqoznMfkFPaIyw5N5yEEb6+ifdb+rKWPOvsX97aQvKa5/ZnFLECKRgN18OyalKHoJ0V1AeTmLefjuu6pqvm3wWB3WhsKFDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add the NXP S32G RTC driver as maintained so further patches on this
driver can be reviewed under this architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 873aa2cce4d7..515ed8115922 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2873,8 +2873,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 R:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
+F:	drivers/rtc/rtc-s32g.c
 
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
-- 
2.45.2


