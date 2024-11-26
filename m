Return-Path: <linux-rtc+bounces-2622-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BB39D965A
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 12:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC459B21792
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 11:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C555E1CEEB8;
	Tue, 26 Nov 2024 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F92bSWn6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A9D1CEE82;
	Tue, 26 Nov 2024 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621468; cv=fail; b=dN9U/3Uz0nooRbP9m/ouQ2LyuQhdUgrwag3N37fEK14dX2HIYEIkbHvMW7qmAzQdKWvAxJUHc2iDF6v72rIpAQI5TPCM6gFl9RjjBfciujGS8qU3piOoVeyI4oNhf2Mpdhh17NcvWtMDusVxyu2rQRDy2bPA1R6arNzJBrQJIYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621468; c=relaxed/simple;
	bh=/s3pHPeOKfPYBacM4Wm+nt0xKCQTkCYvYWWlNVkhEdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lLlsmSkDzFHPx8n3w4CsEW5XVEM4xh9beH/FcyG7dNxsY3rt6pKUR4lIi3CmbOoS+C+9B+0i8HKKrDUo92gdVvSYM3fYv+Ce/I6b3aaVBAnxC34o+JHLUxY5xZoWXwM66Gw7jsAnw0FUGgAkoeWwEnpSbXgQUnw1lpJYTr1pqYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F92bSWn6; arc=fail smtp.client-ip=40.107.22.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aILexwkOflGvwSRiedLGbRSjfBt8ijHXKQqAfZxkmKNoDx+gUuEI1/9ssKYcNik99ERY+kebmTroUX+N/xf1PwuYbIGLG7vp5nn5dgm/pG6Irr/YqCVB5nJJq0S9Fvld2D9cHt1kgpLE0wgn47XaLZzwhMAy2HQyr1wO2SRwnXYfSK37MkbLpPrO+nYB57pg9LL7lnyrpc0hbiuXUwAG7DGrDro47HoT7wh8tbRQl67DuTmMsCM8ErgWMHM4BC/nJ2UbbHyxfQd71+xtQbB9riv7NnCr3lNZ9r5yXweHzGZ6uGEo77MsfWWw4+F9NqKofI3136p14JNKbr+n4ztrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8a6sLsOIRsXMEzvIT3NBqE3VDOrjDn8ju3sDqa+FLG4=;
 b=do2keEuRLw7Hw/oEtzoNnV9g7n3LR6Z3H4u/xIcgj+6AbtwCNYvDJUW/N9WHzKHSanyYr+/L4gJfMSIRhA//ekE9vZxs4xN/PwSvrnUXIH1qZNgIWoxwMx6oETabszUZjCPrFteSzrlBr4EdDAlkjjnJieDOZvzzbahbB2kEevTnEhKe86cClvY3x2PzBjsD+uTaHN2oFullOAHi1grwDu4nK5jjGclLdi2aGMD4dgahWqLgcTxGL5e7yarxHg81kPIa5ImWewcCk18meAqs6dZCcYqmKS06gL/u3qKtLzJ0xEgEOdLq28Dg7rk9GWCKwORNyIHY6RAQL7ZXR5QIbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8a6sLsOIRsXMEzvIT3NBqE3VDOrjDn8ju3sDqa+FLG4=;
 b=F92bSWn6uqiKNwliTfyurXo/UQvyf/SNOHeZKD09acC0DfzG0Bmg+D3BNkcUAS+9Tkyx7HftIjOKLCp/i9RCuRXMdk9tPxV5K+5lwu0pkST6CNKXc6eNGOg5dmyO/TaX8zx0FgboJTk8Gf7gjBnFr/7G57TuKLLjTmn6/xKepYNMb/zbtaGIIwzC9/mC0EGIuQ38fVKKsf7sSruWPlOWcCNM6ZvLD9UvLW1u7ZZSCl1sEzCMEB2W9LjI+dH1jOZohCxATaNQ9KegWHlArrnWfqfjnUh399EMK+UGgpFr867gpnkZlCf4lHGGfpAZ8BRGDJCTYw/rBpN7UepW2W0wVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 11:44:23 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:44:23 +0000
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
	imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v5 0/4] add NXP RTC driver support for S32G2/S32G3 SoCs
Date: Tue, 26 Nov 2024 13:44:10 +0200
Message-ID: <20241126114414.419469-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
References: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0283.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::9) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PR3PR04MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 58bd27aa-db54-4e56-39a8-08dd0e0fac04
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1JJMGppKzRGaXNOa01ueWRhNll3cGlVaE0vNGJmVUdDOWRNU00va1ZGYVhr?=
 =?utf-8?B?bE14enFwZVRBNS9UcWNKb0NONkxBcEpjb0dScitPNGxUTmdMOXArK0NpUzAz?=
 =?utf-8?B?QmVNR1dZbVMzVzZaaXh4LzdwYm5SRjR1NnQ4WWJBN3I0TzNsaU05RjJpaVZZ?=
 =?utf-8?B?MnN2NDZLbVc2cE02WG1kZmR4U1hJUi9UbEU2ekd4SVl0c0FmRU9qSDhrU2ZX?=
 =?utf-8?B?VVlaQ1dMT0Fza29tQUhOUHMrblVndE15b0hLUnVYaUwzWGdVNC9NWUQwWDZI?=
 =?utf-8?B?eUhHU1NiSWQyZldaREp1L004RzBOM1NWZTlxM2xCQ3RmU1NNbEpoK1pxNk5R?=
 =?utf-8?B?aWNZV0pZVVZpNGU3OXNvdjZRM0xpcythaW80bkRmUXN2NnJycjVMZ2hTYjY0?=
 =?utf-8?B?bmVRUWZtRDRPQkw4VE93UktZWHJCc3RhZ1h2YUFwL1hwV3dHOUNSOWh1N25s?=
 =?utf-8?B?YmhYcnJZRSt2R3ZFeHM5MHJveURBU3YyL1lOREdxbktRWFA5MUU5Z1NOOTlY?=
 =?utf-8?B?RGg3ZEFrYlNKS0ppei9NUnFyRDZiUFpoOWZNaWhXek9ldzVsTGphTDRFb0tK?=
 =?utf-8?B?L2NaVVRKaUUvMURTZDUzRmJ5cWJ4TzcvSkJ0WWJlNkM1N2NjYlFJZS8wck5y?=
 =?utf-8?B?MnM1TVlsbVRwcU10RWxTdE1TSDBOajRiZ1RjL0oyUkFhdnh5SVJ2VWw3RXFO?=
 =?utf-8?B?Y3crNm1nR0QvK1N4ZkJKWE9GUC9VcFhNREs5QklsN2ZJWE96ajJ2QVViZFdL?=
 =?utf-8?B?RFQzMGhsMmFEQUczbzFPSnZ4WXVkUlRwa0thV0NwVmpzT1hiaWt5eGNROG51?=
 =?utf-8?B?WlNYQkhwemN1OXZnNitsamhMKzFZV2JnRVJjNERWRGJwb3NSMXpFVXUzc0RN?=
 =?utf-8?B?clVMWmt5cldvKzRRNlJrLy9LSkdqOFlzSWF1UStld1hDMFp2UDhudlQ2cUtw?=
 =?utf-8?B?U01GdVlJblBGOHVnMldZRnN0aHByYnh4UEhYaUd6N2g3Rjg5WldxTFlTcWtD?=
 =?utf-8?B?TjdHcmNyc1Jmd01rOTgwc0VtV1k1ckJUMHJwKzlxR2VRS2xZdDhqTHRrdi9x?=
 =?utf-8?B?SDI4UDNnWElncm5TVVdEWWgwTkpzNE5halZUKzVOQ2FFQUNpeXp3bzREcWZY?=
 =?utf-8?B?THNmYUhaanA5VHRLR3V1T2p2Y2djVDB6UWpjUkR5S3U2eHl2Q1JDdWZWR2ti?=
 =?utf-8?B?VHpWaGsyUEpPT2VkMnBaYUlIaE44MkhNVXYxa2F0eVl2V0tZR05XNks0cXpt?=
 =?utf-8?B?VHJzOFlnaVNYSU02SE5qR1FSVEZ0Sjd1OC9BR1JDY0FqcXViVVg5cG9udFQx?=
 =?utf-8?B?emhRQWovTGNzdEN1TUY2ZUhBbGZNaWhyR2xPcmtzb1VCUmVYTlM0RUtucWJl?=
 =?utf-8?B?ZS8wWXJRVERvRVVPZ3ZOUkZiaGhJQ21GeFJabEZFak11OFMvMUN5ZTYyTnJV?=
 =?utf-8?B?THhjT2d1aXg1MHdHbEcyQkNzM1o5TllFbzVnbS9jZ1hKMmZDVW4xUGFmSFZv?=
 =?utf-8?B?c0JqR0k5OHN3S25zZ092bXd4SHE1VFlvVHMvSWplb2pLMlJRQktJRXh0dHdT?=
 =?utf-8?B?RllYQ2ZRVFRFVzJwSjZtWENQdytOQVg3dW9uL3IyL2l1WVY4SWplRm1LWnVZ?=
 =?utf-8?B?RUdEcjl5RFVxZGExQTVCY1NRa0pXWVVEUWsvY2VKTjRON0xMOC90bG9Fenhi?=
 =?utf-8?B?RkUwM3BteEpaQ3kydHRDWGpkZHJRV3F6bDhrWXNkQnNTNTRObSs4ZXN5Q2FU?=
 =?utf-8?B?VzVXSUQxSzBxKytBZVJLb0dvc0lmOXMydlVTMHFwZUJrVnFGdElxSGZqRC90?=
 =?utf-8?B?ejUzcFZFVzlLbEZPT1V6Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDhWZElETkFBQkZhV2Rna0NBWEpCd3lCTW9tUXJ1cGJIVUhJY085bVJadXJt?=
 =?utf-8?B?ak40Wkt4SmUweUw5NUlDR0FKT1lWZENIWWh2Y0VHc3NwYklvVEQ2eWxSWkRN?=
 =?utf-8?B?WHBuTkhJWWNzd0xHbm9Id1RBbTZ1bkUveEtvMWk1cVV3NmFZaEJUbjE4b2dj?=
 =?utf-8?B?bDBRbldYTWdPTzRiQXJUQ3pDUUkrZGFJRzdlT1R2NEZQcUx3OU1UMUFFOHhq?=
 =?utf-8?B?Q2E0elNocTJrUW11SWtCd1B4SlhRUlBFUDFJNUFzVng4TkNPZGZ2emhnZm9Y?=
 =?utf-8?B?TXlpZzUwblc1VWlMQk8zblpzWjJNdUh6K2VLaVRVK2crQTNQQ2NiMkNiS0Fu?=
 =?utf-8?B?Tk9SSlJWek1HSUNxQmVEVit3WStMWWZzRy8vdmJvYm5UeUJsYi9nYkoxM3Ix?=
 =?utf-8?B?RG00ZTBqOENSS21yRWp5NTRzYXpxcEtucm9kckZWSERPSzRDYU54bWJuaFcw?=
 =?utf-8?B?dlZxcG45azMyNHhOeTVHNHJGRTlSL3BtZTN3akVLNTdrWU00azRkN29Tb0c4?=
 =?utf-8?B?TkdGZkFDV05rNTkxKzhDY3g5SFk2ZGhFZ2ZYRkp3WTlDM3N1aFJ1aGo5a3cy?=
 =?utf-8?B?WU1yNlJVVkUwNUVFQnNGNGlpcTIrL1FFOStkNndmbTdPM2RlYVhldzJGeHhu?=
 =?utf-8?B?RHlkRFhYbjg0WVRsK1FKYzBVY1V3a2NETnFCYkg2dit0aXVhSjA0S1NTdEVP?=
 =?utf-8?B?Yk1Nc1lGVjB3VW5oTnFnQlEzRGNVWUQ2MytZYUdYT1VJN2VoZ2ZpYWFOYVFq?=
 =?utf-8?B?c2p1WjVZOVpoOFRla0FEcWNPcG55SmJxQ1JkSXNIeHZSNHdYeTJ2OGV4Tk4x?=
 =?utf-8?B?SUtVWm1uSkQ2anQrLzA5eE1aT1lzRFM1a0NMMmJOT0toRzVTSkRIaUQxYjQw?=
 =?utf-8?B?WjVWZy9MVWlxL3VVSkhKem9zWTRJMk5MMkZ1dURQVUl4SVVSK3hMRGF5RkNV?=
 =?utf-8?B?cldxNzRRNmRYTXBrR1l2S0RRWURYOGtoc1N0MTBrbGp6UGdOZU9Ldk14cmJ6?=
 =?utf-8?B?VHU5aWN6aWVLeG1wbFQwRzZWK2ZMUEN3amZCZ2d3b1Y2bnJQWVBFQjZ6ejYv?=
 =?utf-8?B?TlZyamxTOVVqVXI5YkFkUFRHa2RIZ1Nhaks1Y21neXpRT2p3MHJFNDFjVHZW?=
 =?utf-8?B?WEdQRUFVa1MxVlQyNW93WnA1UUVSOWJnNnhGbDhpQ1NkNU1ScnpIQjgvckQ5?=
 =?utf-8?B?ZS9rNmc5eC9HV210MmNmTmZtNHhJaTd6TDVBNmR2MVpjcUJGL0l5SmdpSnly?=
 =?utf-8?B?V2VsSTh5bk51eDBSU3Y4MVpCZlBvY2JKdmM4ay9WYWhnU1lSNXdCUkRMMlc0?=
 =?utf-8?B?bkVBVTRPejBvQTNTak8yNmptMmZqSThFR20vb0hJaG5PZWQwZy95U1hSYzVs?=
 =?utf-8?B?VWNGTUV4bGE1MVZSUXMzWFVpZ1lwaWg1ZHlEWW8rc2l1K3E1QnRGM0RoTWxs?=
 =?utf-8?B?eUNFdnRMTkY3ald4R0VDeFVDS01BSDVtQVVtSndGWE4wQm9xem9GcGZ4TWdo?=
 =?utf-8?B?cEIvOUlUZXpyeE9EeURmMEhIRElnNVhPRGRYSVNOdHc4WitQU2dYZmJUbGVi?=
 =?utf-8?B?V2JJMC90YVRQd2s3bG93WlFpSXJwTXZQQUFxNGlKaE9FbUZZdkJiUHJHWE9x?=
 =?utf-8?B?T2ppOEpIb0ZiZzBTM0NNT1VXcnh1ZjlQZ2JEcndqeUYwT0c4bkw0UW1YcHlp?=
 =?utf-8?B?NDdMMXdmcW81T0ZzZVJLeDVmeFY0a081TVlESXRiUDl0am5lV3JUS2tIK08w?=
 =?utf-8?B?amVGMGU0Q1hxVXl0ZHF1R0lxblZxUW1kVWs0YU5DTFJTT2JBWEU4WFNPeWti?=
 =?utf-8?B?ai9pZ1E0ZU82eWlVcFdYNkg5Sm1aUkVSUFk5cENROXVKS2drN3VCVXZRUldi?=
 =?utf-8?B?WTJaMEhLM3IwVGZodzQ5b0Qza3lZTkJaWEcxeWJFTW9FS2R4YnhxRnlISlhB?=
 =?utf-8?B?enVYUnpWUm9ObzdZcklpKzg2T29wVDhpUHJmdkdVMVlhR3BhMEwydThZSlhQ?=
 =?utf-8?B?dmVLandXWGNuQXcrM2Y1ZzY0YTgxamhPZ0lsQVl2RmMxcVJ2czVtRGdndjRh?=
 =?utf-8?B?akFtQmp0a29tUzd2VllIMFp2aDEzRWZVekoxY0djTHFOMEZaL0Z2SCtmY1JJ?=
 =?utf-8?B?dlozRDY0VXJ2ZTVSYmhYL3hZSm9MZ24vdUYzczR6akw5VzgrcUtGY1FiQmhS?=
 =?utf-8?B?WFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bd27aa-db54-4e56-39a8-08dd0e0fac04
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:44:23.1557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCTjhLpNstJ+801zMtzQDa+x9t3VKGvDN379EDfZTn6fGYmPjSQeTCk3aPk7Ldv8QdFftyVrSERWFZAN+axE+4IqM+yABi5BKdLyK9ltVC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch series add support for the NXP RTC hardware module present on
S32G2/S32G3 SoCs.

RTC tracks clock time during system suspend. It is used as a time-based
wakeup source for the S32G2/S32G3 SoCs.

RTC is not battery-powered and it is not kept alive during system reset.

Following is an example of Suspend to RAM trigger on S32G2/S32G3 SoCs,
using userspace tools such as rtcwake:
# rtcwake -s 2 -m mem
# rtcwake: assuming RTC uses UTC ...
# rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036
#

Changes in V5:
- Removed rollover support.
- Removed clock switching support between Runtime and Suspend. A clock source
  which is always available has been used instead.
- Enabled 512 value RTC hardware frequency divisor to achieve higher rollover
  time
- Removed unneeded 'remove' callback.
- Decreased driver print verbosity on error paths.
- Provided 'clock-names' actual names in bindings documentation
- Remove __maybe_unused notations. Used the DEFINE_SIMPLE_DEV_PM_OPS() and
  pm_sleep_ptr() macros to handle the .suspend/.resume callbacks.
- Fixed some alignment issues.

Changes in V4:
- Dropped 'assigned-*' clock management approach. Simplified RTC Runtime
  and Suspend/Standby clock configuration.
- Simplified error paths on probe function
- Removed node label from bindings example
- Several cosmetic coding style fixes

Changes in V3:
- Removed 'nxp,s32g3-rtc' compatible string
- Change to 'remove' callback from 'remove_new'
- Used 'dev.parent' from 'struct rtc_device' instead of defining a
  specific 'struct device' in driver data
- Fixed several errors reported by kernel test robot
- Removed 'assigned-clocks', 'assigned-clock-parents' and
  'assigned-clock-rates' from required properties in the binding
  documentation.
- Refactored S32G RTC driver such that a default clock source and
  divisors configuration will be applied in case 'assigned-clocks' and
  'assigned-clock-parents' properties are missing.

Changes in V2:
- Removed 'clksel' support from dts bindings. Used clock parents support
  from CCF to better illustrate the RTC hardware IP from S32G2/S32G3.
- Removed frequency dividers support from dts bindings. Used assigned
  clock frequencies support from CCF instead.
- Reduced the interval while RTC is voluntarily disabled to a simple
  register write in order to avoid any race condition between a possbile
  rollover and 'suspend' callback execution flow.
- Updated bindings documentation with respect to clocking support.
- Fixed a potential unused variable warning reported by kernel test robot.
- Updated to usage of 'devm_rtc_allocate_device' and 'devm_rtc_register_device'
  instead of deprecated 'devm_rtc_device_register'.

Ciprian Marian Costea (4):
  dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
  rtc: s32g: add NXP S32G2/S32G3 SoC support
  arm64: defconfig: add S32G RTC module support
  MAINTAINERS: add NXP S32G RTC driver

 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml |  69 +++
 MAINTAINERS                                   |   2 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-s32g.c                        | 554 ++++++++++++++++++
 6 files changed, 638 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 create mode 100644 drivers/rtc/rtc-s32g.c

-- 
2.45.2


