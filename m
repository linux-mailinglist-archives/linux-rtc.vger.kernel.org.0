Return-Path: <linux-rtc+bounces-2672-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8851A9E6797
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 08:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F44282939
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 07:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A551DD0D4;
	Fri,  6 Dec 2024 07:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iQ3MSSNV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23EF1DB363;
	Fri,  6 Dec 2024 07:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733469010; cv=fail; b=NJEQ5a8/7fY24Zhs5G1if2jpBPIp5F0WxTKNZXJ3zgC79sAQLrWhLYXNqjNlZK5jJDj5VqznvxcnpkQTuvpQ+kpGqVKOWD/nh2cW2UEZozcjIe3PtyksDr8rkvs72ZS+pBCodqOIFEPOiJornw0ETuDka4jlOHZ4g26URhtaH5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733469010; c=relaxed/simple;
	bh=GT2eSQCeYDlgBq4QbxaKas43GHQWk+cuYlbkT6lAvx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sQ3OeZtAFJ0L8nimF8Lsut4GjgEBaRZndtJ1rn1TH4FPACgSVGlipYGJiNvd2e+pI8yCisrzUfKTCx6uSigGtwhnbD9VzWC5RDH5Ji5tb4aesajSJmrGWOLN80eXmoWxqiTg/nGQ42ZQDqc5FL1lmZlVSqrXXKaJgGvOU9IUsF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iQ3MSSNV; arc=fail smtp.client-ip=40.107.22.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sT50haU8MhTOiPuofkrGh9rHQva4Js/E8K56MYtCKRemrTdFKNh8PokZhzzb6bLAOr+9ocUJq+HYlZ8KEJATl5QuJ+Gtb3uaLydDT8BETEVVw0BjgfdfKGniWnNfe6JJ/3Ow+5J6aXqR2zFRZles1hzWQwX6KOBh0Kfmzo7awRg+P/pW5JWCaqGzsNzhcgP/aovjeTTGB5TtpFfgFiPtItjgqfmubKTqfAa4d+zx/u1IqRfVm+foTlKJq6tP9kB0bq5GxuNDllU+Pq915qOWF7VwmA76pyzNJ+XPGvI4I6Y2A+odv07Y+lsQ5mn1WcG5KizJzW1XmbEJ7NoT4VYzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtm3MyqGq7l0RwwAhISvajKKCxuLpQKkvVork+J4XO4=;
 b=yPkifMxWBZTTlY/DywEvbadP9M7e800nFv85C76U5jYqrdJEpfo5x8UOTe8lICWS5kUDWmxefH0+ThpQfo6mzKwQ+vlP5ha4i807xH6PZPbeEw3qYCsShIh6aUfZ9QaEHSJYekwVAgevKmf6ZTpylQdARZ6GRR2BAJyqQdRtMAh5DIlOIvFzvMhev9rPdYZEXDEJFpMuFxqWLRieN48+Tw52DvoT3Sdqo9b39psIToiFaPId1cmez5GCojPfUflfdj0k6R3eHDARB5wap+IA5EjB6L5S/FZ9eqiCEY42YZy14siX8AwChbCCDnZ+bXWHkpG34wavAcAPa5/WE8d2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtm3MyqGq7l0RwwAhISvajKKCxuLpQKkvVork+J4XO4=;
 b=iQ3MSSNVSmDzEFgtd234fR5cKGcCZf+dooKmQbTGQt9KNcEBdD2irRZW0RTtOUnvjIFEHxx8eYAQ0CXOqmTUL/CzV1Y9ZRMYBB27yOxqTGYoMoJCc5xTGZMfaMKvK/DGrSulwY45t88IZxfSKwqTEvEOq7YeKDufRTE2R3F6uvH6GIMSy9+2kbB4DyONO23vPzlw1ahLVj7tcPrxHU19bL/2w1GVgkb9oktFQgeUGEdx5/+UDk0UgNw8Fq8I+K7pNd3hbCm6yvDSkjW+DzsY+lMQzW8v4OHj5+hMfIYTfc3d1BLfa0Ozd05FjamLjVHtEN2/YtbSJkpWfM+RLxM77A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB9PR04MB9889.eurprd04.prod.outlook.com (2603:10a6:10:4ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.10; Fri, 6 Dec
 2024 07:10:01 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 07:10:01 +0000
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
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v6 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Date: Fri,  6 Dec 2024 09:09:52 +0200
Message-ID: <20241206070955.1503412-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0106.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::47) To DU0PR04MB9251.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 0949f619-d032-492f-c8c9-08dd15c5003b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alppNkJzd1BqMVZhL2FZdkZpb1FjZDFkNm15WG5JNXpFUTR4NWVRUEFCamVF?=
 =?utf-8?B?WTBiVWIyZGtGUTJ6N3NGVHJrblRTM05OSXpFWllDeUhJakpTMTZ2TG4zNUR2?=
 =?utf-8?B?d2EzK1k2NnZ4c044UDVoVHFNbWdob25tVkpGVXpFL0VWV21PNm40OGV1Sytv?=
 =?utf-8?B?V3FhSm95LzV3eCs5ayt1MnpkNC91TThlU1d5c0xzS1p1WTB1anZXM2RORmlm?=
 =?utf-8?B?WUw5ZFJ1WkJsQnBqZUdYRW5DNENkTE5HVFJEck9JK2xmUCtTL093M3lOd0d2?=
 =?utf-8?B?Z3JwMlRwNFRzbWxFV2VoYllBRVUrUHRvY2RjblJ4eEdkTEltS3M1QzdFdjc3?=
 =?utf-8?B?SGZHbDMwVnZuZ2NPajV5YzB5eGtkM2FFdnVrem1mbkN0ME5ib2dDTVhvZjVT?=
 =?utf-8?B?RkhkQk5Ia0I2MWRWanNGeXpuZEM5UmZOTjgwTmczc3o2QThzZ3gvVEhBZDMv?=
 =?utf-8?B?amFDMEhHaFhLUWN4c3p2a3hzOHZaeTJzMllWVXVSd2w2VWNpZ1RyZWVVVWRI?=
 =?utf-8?B?eDBuNldISGIzY0ZhdW9MbWdBT3JqZmpuaXV5Yld3VTkzVmlyMFIvNW8xT1RR?=
 =?utf-8?B?aEI4cnIyWm4xNldNV1ZDdHdyM3A5QW13bHBDRzRMZDNiaG00ZkhqdEgxTVdJ?=
 =?utf-8?B?enBJenhPcytoc0tlYkJzbkw0UU5MS2RsanNUZU9xVVBpS3cxSHlESitLTlU3?=
 =?utf-8?B?ekZUcHl6akRhK3lxbFNDWU1nUzJWWHJFVUk0Qyt6cWMveTQ2eHdqS0hhN1Na?=
 =?utf-8?B?aVBMZDNMUHUrbjIxQWZvZW9mWDdIOUFEc0N0emZSeHpHSjdYQkNJZHgybStm?=
 =?utf-8?B?a3hHLzd0STY0bVZ2d2dGV3RGOGEvWmZDdExWNDdmc0pHSWNCd09UU2hVZFl0?=
 =?utf-8?B?dWt2VWJNOFpzUUI1bDA3MkxuR2hXalZocDFYVDVIc3NVOS8vNUNrYklEYTl6?=
 =?utf-8?B?Ym1KemY5RmlLNkV5U0JsaUlZTHNFRC9QSlhWSm8rbmdqZ3dTNFBtNS9NT1g0?=
 =?utf-8?B?TlVucHljNXBGRUw4VSs2R25MZHdYcGlyV1RLVkg3Q0ZoZm5VbHZYd1IvRHJS?=
 =?utf-8?B?a1JjUFV1Y3hhTFA3cStUYkVubmYreEZSdkxLSEJyME0vanlZYlpCNUNsZEdz?=
 =?utf-8?B?TVdENTFkOFVHUEQ5d1RhZlJGdDUvUExkR3NpWkp1SURiUEl6Qm1NVktoKzFE?=
 =?utf-8?B?TjVKeENrdTlEVkpXNnlieVR0WXlud0NVL3JYSis5TjFYcWFlNE5kUlJvRWRU?=
 =?utf-8?B?cEtsK0o2RnRtdzVLQ05uMWxFOUpNSmlJVk9zOFhSUG9tL3YwczY4amVVYXkr?=
 =?utf-8?B?cjc1QnE3US9DbS80QUU1Z2hSYmgzWXVLajg1OXdQZ3l3dWVCcXNtbkFrTndy?=
 =?utf-8?B?azNXUEp5aDhLTmt3Ylg2dFV0bkR6cWZoSFV4b0VmTFJGZVNDaEg1NzdQNkQ2?=
 =?utf-8?B?SzZOMDRYNkwzd0JOOVdvNEtrdDNVdURpVHViOENVMWQ0UUhYQmgyL1RZNFVI?=
 =?utf-8?B?bWNvQ2hJWVNKZVBjUCs4YWVOdG5OYkxCRmRNZXF2dmZBZ2NiUlkvRXdzQjRn?=
 =?utf-8?B?UVk5ek96UDVkRko3UVdkUXN5RldtaE9ldDlYQUdObVdvZVFlcUR0NTB5Myty?=
 =?utf-8?B?ZHpYYVcwSVpSYkdXMWJMV0liUG9VeWRsSm5EL1lmN05tcndvWEtQb0RweGpX?=
 =?utf-8?B?THVHL212dmhlY2trS0Znbzh5UEU0UVVHOW5oVTNoQStOaXpScjdOTzA2VVIx?=
 =?utf-8?Q?DzEk54upiQruXBdrtaoz6eNDhpWhHruRTL8/0U+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUF5OHVlNFRBS2kwSWxOOStJbTFnUVF5cHhUSDFHWng0ajhMaUVCNmI5QVYv?=
 =?utf-8?B?di9GeU5vLzNPUzFmM3ZjNmZEM0ZxWDJEeFVIN0JRSDhSaktWTHdwUU1rWHBi?=
 =?utf-8?B?bzVvZ2l1RlgxKzBaMzNobHF6THd4dncyVkUvZlR2ZjhmS1pUQ2ZRQjdML2M0?=
 =?utf-8?B?cXFrVDdmSWtRUHh5amgxZ2VBL2ZkU2JiWmFZZjdaUU94Z1k1bE1XTEJKdXla?=
 =?utf-8?B?M1FHRThKckZGNmxwd1dYVVZmajE2bnV2Ym90YkRNTG1lM0k5OFk5T1pXanBk?=
 =?utf-8?B?TG43VHlYYUtTZHlsSkJXNmVWR0VucC9UckVBV2N1R3JLM3BzTHBQeW9zaFMy?=
 =?utf-8?B?MkdWMGNRTXMzeVJzM3R2S0d0VE9ZclQyRG1uNzFIQmRQZnJ6MVFRTnYvWFdv?=
 =?utf-8?B?NjJYMyt5a1U3bjNVVktHbGJwQ0ZhOGt2UmhnWkhvNlR5ZXBtVkhyMXFaMnFY?=
 =?utf-8?B?NEJUVVlvdk9XczhFTU1teVdvTkNhZnJBUi9LYzZOcjdEWUFCR1BQaHZ0SkY5?=
 =?utf-8?B?Um1NbjhMdVE0eEFoOXlqMEFjSzZ4dXByUityaDR0c1dtS0wreFUyY1FsRzBH?=
 =?utf-8?B?Wmx0UDVjbjBEdll5Uzk0UEJ5Q3VML3E0cytLR0NEUWlhbG0wTUlCbzhLZklL?=
 =?utf-8?B?ZWx5Y3MzaVAyemdKUWpwR25Dd1EwUXU3eEdsWlZuMUM0NEtXb0JzaEQvQlNS?=
 =?utf-8?B?VCs2NjFOTC8xZFBHZE9TSHNHd2RBWVlWK2wvb0dLSnBZWVNWazRxWjl2T055?=
 =?utf-8?B?MDZjT3JJVURPSFprcDg0dHR1SVQ5SXgwbmg3WmlxQXlKUmxIeXVpc3dvbmVL?=
 =?utf-8?B?VlpYYk44SmRJek42cEZxUlMwVGhpTUZ3ZnlCZ0hNanJlK2Z6UmdBMVF6Ky9D?=
 =?utf-8?B?VVlWMldqMXR1UTJaYTJPb3BDN2c0aTdKeXJ6akFPc1AzNjFRa3cwYlpyOXlo?=
 =?utf-8?B?QTJKbFFQb1pXemF5VWRuZkNibGxnbm5SaXRRdGRHTStFUVhobld2VGpOT0pt?=
 =?utf-8?B?c09vNzNydHVZeEFDV1hOMHBCNHNGRDl3QmVGYnpJYWYxUzNRR2Y5UjRtMVFx?=
 =?utf-8?B?S0lHUi9wT2pkRFRnS1BjWnZPcUt0RWF2U0dGaUR0YW40eC9qMGVDbHZxS1py?=
 =?utf-8?B?OFZRN0pJMG1uYzJwTHY5blhXVWl0Sm5OeTdJdTYxTEtOa0ZjTWRlZm9VdmJO?=
 =?utf-8?B?MERBQys4b25vNWlCOGVoeGttNWR0c1cyTVJoUVI4Wk1Da3ArTDc5clFkdUhN?=
 =?utf-8?B?RTVxamZ6NlY0Zi91a3ZBcG1adkJjTmxXWDFvU0pNLzc5S2hiME85Q3FiS3g0?=
 =?utf-8?B?Qko3dXpHVUdyT2EzY0xORGladkh0c1I4bUxzd3JRSHYvejRhUzZiS2x5a1dh?=
 =?utf-8?B?V3RQZythVWhpUUFnbW83QTRscERnZjByYmliNHhRajNnZ2RZa3FyYk9HbUVK?=
 =?utf-8?B?ekJNa1BjQ3JaYSt1d3hWR0ltdXhEek13V3BtaG51STE5enNuNlg2TkxnVFlr?=
 =?utf-8?B?cnR0eHJFbHI4YjlHdWxaUlZNRjRhQkpsaVRlZ0xsdmdDWUlyWkcxY05rZEZ5?=
 =?utf-8?B?RXNqSlkwL2ZQTzVoQitpZzZVL0IxME1rNFhYc3E2NFIweFRPWEh4aFdKdUVH?=
 =?utf-8?B?MHlCcU9nV2hLeUlXdEpmcHU0RkFad2FIblRMNDdQWDk2QVJMaDhZUWlkSXhp?=
 =?utf-8?B?SUFqS1JhVE9MSkdxSlVIL2dxYUFWOERCdUM5MDJXRlByczRDRCtGdzdvMThG?=
 =?utf-8?B?NDNTQU40WEFGUEEyRndMZVkrbWgxVGNTS3ZBV1VaSW5UdEorR2lVTWllZ0FO?=
 =?utf-8?B?UTZyaStlNWpyWVpaTFlEWUMzUEJ2cmZTZ3RwNmtDRFQyYUI5dVJMTDNEWVY4?=
 =?utf-8?B?N3g4cDQrcnk3aVhiUVFnbVZGM090dENzdjJ6RlVNcTNEODNUT0cxbGRpc2VZ?=
 =?utf-8?B?TjN4VHA0WEN1Yk5ocy8wSjlzaVlmZWI0WTNSbUpkS1plTjZtUmNUWG1WU3c2?=
 =?utf-8?B?blhZN0E4TTZJZURiZWgzRFY0SEhOSU0vQ1VIMjVqcWx0bFBiMWw1QzhCblcz?=
 =?utf-8?B?Z2lZQlZtRkExWnlyRVNoMUFwSXlSSGNjVkQrLzh4VWNtZVlMMHI4blBHU2R1?=
 =?utf-8?B?bFEyZnpXVGt3dkV1S2oxUXlReVZjM2RFM2dXaFlXWDFnaHkyRFZpZFRyZStK?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0949f619-d032-492f-c8c9-08dd15c5003b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 07:10:01.4555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uP6AC/mx8oiWCLtNcJkkJT2T+dARwVr9LAji/Htw43As61SbvjGw2HtICMXcT+5JIwKQR7SLwEYUkcpOu233EB9fDWGibtRwrUm3X+XtmiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9889

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

RTC tracks clock time during system suspend and it is used as a wakeup
source on S32G2/S32G3 architecture.

RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
during system reset.

Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
new file mode 100644
index 000000000000..40fd2fa298fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
@@ -0,0 +1,72 @@
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
+description:
+  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup source.
+  It is not kept alive during system reset and it is not battery-powered.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-rtc
+      - items:
+          - const: nxp,s32g3-rtc
+          - const: nxp,s32g2-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ipg clock drives the access to the RTC iomapped registers
+      - description: Clock source for the RTC module. Can be selected between
+          4 different clock sources using an integrated hardware mux.
+          On S32G2/S32G3 SoCs, 'source0' is the SIRC clock (~32KHz) and it is
+          available during standby and runtime. 'source1' is reserved and cannot
+          be used. 'source2' is the FIRC clock and it is only available during
+          runtime providing a better resolution (~48MHz). 'source3' is an external
+          RTC clock source which can be additionally added in hardware.
+
+  clock-names:
+    items:
+      - const: ipg
+      - enum: [ source0, source1, source2, source3 ]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@40060000 {
+        compatible = "nxp,s32g3-rtc",
+                     "nxp,s32g2-rtc";
+        reg = <0x40060000 0x1000>;
+        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 54>, <&clks 55>;
+        clock-names = "ipg", "source0";
+    };
-- 
2.45.2


