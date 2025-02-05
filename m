Return-Path: <linux-rtc+bounces-3093-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6442A28075
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 01:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496D63A1D2B
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 00:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BED5227BB7;
	Wed,  5 Feb 2025 00:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SSRj6NMI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CB5227B9D;
	Wed,  5 Feb 2025 00:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738717158; cv=fail; b=M/34/iNWGpbAgvUJIWMIXLvDH1OllPkf0M2zQicmGvvmIoR8mkJ+IbYcH1aycDW9xQr5TXlDDYop9DwR7D2ngBZizLNdYd5PTenDEHUZhPeO3jwM+w1gdRPYWzGnMFKOLXzaqAPaBOwWr3jHF3JWf4WzjuXylgUTEKeR18Wb5dQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738717158; c=relaxed/simple;
	bh=tL4q6530H9Plp4QYXqVVA23ERiPbWu5moLORe5Q605w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JkBxGRXK6yE1/p3zaOxyHZtah8AafFYwlMyxjPJGVhXp+gmOK/T3+URZ42ibyTTNhq2gAIx7IZ8xZW49E/vUixSvkEPGRv4A3LgwcNsGHdgAs0MMMAgsoDgNUQd2oBNo27KCpz3jw4Vjl8+3D9/JeNnviVgkoexKtBEKEFD3dlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SSRj6NMI; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hgz+tF5bRZ5pi15daCNM+b9SL0SkV2QBZaSxWPz/DF9zkQ52mZCOWJgahUhf+vZeZ2FemrLT4ieIXElQpkW52bV7ySfwf2FCLyk0HcSjiu8M+55OyCkn/lk84cPOtUuGN7T2THhrlVo+cfDOjhYTXHEYNQM1J14+qbHfjCwggJDc1me/O82LqzLQKsWW2xIpgiuHk8kRfPQrmasWrDvVgHaUmWx7/ut/1tWlOfzhvGHBQcFpV4ebda9XBjtxG0xxZ2YUUDdHOQoRzBNa62qMEd+8fqj+rjNafq7rXP/loCZV9E8h3vdTC9Ni3lXQ8cmA6tMGUPltSWLX0RfeMKLLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXhN8yZODNUAFFzTvDXueHauX0spZjv+doLw4DqIRFA=;
 b=hRDcZlbQYgnPziO1TpwRtfNywnXZbvM7uZk1Z8ui0cGvS132Xb4j0PTIKE2eS1n+eXjEMha2HmCtoLCQkCxnTyJ6WMsCawj0vjZbMQ8gDbbW7S9z8gngYEG193MYtBlj+AUS/Akokjp+CN3whU1+i4HxGbYcqBZDl8dwk1HbKQ9pKwYkGZlbVLVFBTjsYnP0/za31xz79dz0vHCBtfnh+AdBZdrT2lNcc0InQ/KckJZThWAp2ZwmvpoHlnUeJcCAu3DGlPtizR3FlZNXJDQlIfz8ewgJQILp+GzlNepGjK6lsOnDi575+RAEFisIlX8U3kbd2j+B4vwIoqGgHOIFbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXhN8yZODNUAFFzTvDXueHauX0spZjv+doLw4DqIRFA=;
 b=SSRj6NMITme3BmCQyggX91rD+xXzcDvoYjOvKWZAREPcgnQNLeVXZNv5M+1lb0f4ag42srQcvcDdpMHjIAeHTiy+0lcwh1SVGz2+kN89LW+gzUK6p81EDi4t9KNl9QRss5b/L2jF9gM6tDmahATootyq9wfh1zgJ/gcIe8EXyHVC7uMiYOY/nmen101sYeRSgjfricu9C+f8y6UlyxqB7XHQIKafarnOBSNfpDyzV5F3IJP+V/IL1Hz58xWVvufxsxCJJEezTxM09CtMLwkDSwqdZQm8eann3dU2/c4UWywTU4sZz18TbYEkAB614lcHxbBq24ibzIOytzDKAYDxoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10713.eurprd04.prod.outlook.com (2603:10a6:800:275::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:59:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:59:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 08:58:19 +0800
Subject: [PATCH 1/7] rtc: stm32: Use resource managed API to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-rtc-cleanup-v1-1-66165678e089@nxp.com>
References: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
In-Reply-To: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>, Antonio Borneo <antonio.borneo@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738717111; l=1587;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=mSTCl6oCfnAa45eZZ0ce81+vqGl5rBwE3yA3RKdgxSo=;
 b=Lk2a2rVgsQVbE64qePKxXCkNhWNVGlTJaj4JEupetcuunmnR/EErmB3/D3wwreSFhSh+WzdaX
 WTLr3G09U4QAFHak6Ng+ayGTwEopXQOaC+KXtjNT6urJ+uuLKBqHa1h
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10713:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d3215b-3ecc-4065-7f04-08dd45804ee1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2p6VXpWUnQreTd1STV1bkxUZmc5Z2hGb0I3U1dNV0RYSUora0U0Wk5SWDg5?=
 =?utf-8?B?eGR5YVNRNXRKS0xqVVVITGZ2eGw4KzNQb3pDa3pTUW5XY0hKRG11Ylpqbjhu?=
 =?utf-8?B?QXpTWUlzTnh2bCt2K05vM0pMdDdpcEtma2didVp0dGxreS9Jb24zMUtBRVU2?=
 =?utf-8?B?QkI4aVRtUFdabm1FY25TUStjdmpaV3YzYmU2Y2REc0FjbkFjZm5MajkrQUI4?=
 =?utf-8?B?RVVtY0Vta3YwdEFVVU5DWDNHcFY1emdIOWFvUFFnbEdmUFdFUC8rdHg1Sk9x?=
 =?utf-8?B?eDdnWXNwME1qMEhDV3JQaERQM01RZFBLa3BXNjYxbWVlYm44ZXRWTkVVM09l?=
 =?utf-8?B?YXpHcit3UEtXRE9qVG5ISGVWM2xnZUdwck5CaDFqMzdhTXFXTEtYdGE3azdS?=
 =?utf-8?B?RjJxM3B1UTdHUTMzTkNRQUVQQ1NxS0gzZnpJaHoyUFFLM3BGemFxZVY4dEty?=
 =?utf-8?B?UXMrZDJtdnFhRkxNZ1dnWkR4b3VvMVliSkIxcjVDbXdUckVCRnRDa2lmYkFB?=
 =?utf-8?B?SG42NTVzck9EdGVNVXhtRlVYTklwL3NvWGJKbTZBazF1MmpGUnNOa2VPRjRB?=
 =?utf-8?B?MEdLOEhhcW1VaGpuNk4yVVQ3cWl1UjhwRkQrcGErT3R3K0tiYXlodm9pMm50?=
 =?utf-8?B?Ui9zWjBiemZoQzJKN1hLdGtDb203eUlXTFJVUkRrTWUydkhuUEEzYkkySkZ5?=
 =?utf-8?B?SDBnaHBkRTNhd0lBd1VoaWc1SVkzcCsvcXhxSXY2MS9aaU9QZTNIODdxQWRs?=
 =?utf-8?B?cnBoQzFxOThENXRFYkZoOThKWEFaQTZ4eFhrVTBmSnVBVmNQV2Ewc05HMjZD?=
 =?utf-8?B?OGdnMHg1Z0NUVEs4cUxEM1VyUi9weHM3YnU4U0pMQzFPVEJRRnNncWdKWVZK?=
 =?utf-8?B?cTZyLytEZmlkVUV6TzdIelNlcjdSaTBYQXRlSzhEZFN3bzlybm5oN0RKODhB?=
 =?utf-8?B?U28xN1A2SlJ3VUhGbDlGSXlvbWNTMnZkbmdPVDNMaWQxeS9jai9pY0dGZkEw?=
 =?utf-8?B?RVZGWS9VVC9UVnVNNklDOG83cGNjMjhTUENBOVo4UzFFWTBwLzBTeTJmUjJu?=
 =?utf-8?B?aXArNFM1UGJSb1I4Uit4dEZzdVRFWFRKZDNqUlpVdEFGaDVxdCtZNG5qb2pK?=
 =?utf-8?B?TE5GVTBUMFRIU0k0VVZqOFJ3ZDg1NlVrWEl6Q0dxZ3pMOStLK1RIR2JjZEY1?=
 =?utf-8?B?c2Y5TnFvZjRWQ0FpMm5GMit6NzB1YWkrb0JUbUUySVJpWmxEZUxLRjJsUHlq?=
 =?utf-8?B?MjFMRHhNQ1RHSjhGK0ZUSVlJa3BxdU9nd1JkeHQ4akdUMDNNaTVrUUFkSWhN?=
 =?utf-8?B?VnB3QVJMcUw2eG9pS21TSVNTU3NDenlFb2M5cWtacnVVQ0NNQlZXaDlkeEYz?=
 =?utf-8?B?Y3UyWVVJYnpqOE5HZ3FGN3loZ0prTGo5NDcyUkVjcmxSRi9iNnJ6NU44OWZ4?=
 =?utf-8?B?a0d1V21kQVk2NDVMUmloV2UwZzdoMEl4MElFa3BNY3lnYm1ERGFsSzNPQ3FC?=
 =?utf-8?B?TTRPeldmWjFQaTNQcS96bmt4VkZQdmxDdUEvdC9HbWM5SVVudnhCQ1BRNm5z?=
 =?utf-8?B?WEd3eWlseUZkeS92WGVzc0VwcThxTmFUb0VUbGk5dUdlZ05PR1U0UHhQNDkx?=
 =?utf-8?B?Y05COVlmVFdPZWE5RllWRGZWaUx6VllZT1RJSUFlWit5ZnRhbDNQM21oR29Z?=
 =?utf-8?B?UkdYN29GU1hjTUZ0VnExOS9pZmNmWFh4TWxSYjFDMnU3NTkwTGpjOGVld1dx?=
 =?utf-8?B?OFdMamJ5ZmZFWVZQRWhQaHRZSUZYSnFHdi9yaWRvem9zUjFBb041a1l6cjZR?=
 =?utf-8?B?TEZnUDhKQ1BLQm53TGM5WWQwZHVOVUtsMHJ4S3VwM0RWWnNzRmxiS2dXL091?=
 =?utf-8?B?NXUrU2V3dHM1VWM4NFUwNzlhYzlveUdQeGkrQzRmOXNaNUhlN3FTeTFzQXo5?=
 =?utf-8?Q?cHBcMcZeDAwlDCjRoNiLWLLmLDV+4R8O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjhsNWR1c0xrSGx3TG96VnhFTGg0OTdvQ3QwaEJsbG5VZ3J2ZjBjcDRkOFRt?=
 =?utf-8?B?eGFvWWZzTTdyZnZKR1FuMTM1Q2ZLV2xuNDB4akpsTzE4Q2hsVDdGbGlHQ242?=
 =?utf-8?B?VXJ3cm1xRkswZWR2b1VURGhXVStDdnpPZnNuSXZybHNhRmgveVl4ajVDbXdt?=
 =?utf-8?B?YWZmZXV2UkVuRWtOREI3Z0RvSFBtakowRURPckcyYjc4eW5FMnA4TzBTNmpX?=
 =?utf-8?B?OGd0OFdjSDZTK1ZPdmZ6d3Y1L0V5S1NTZ3hFK2h5WGJUVHFUKzBmdHJTbXU2?=
 =?utf-8?B?dmpFZ28vTDdiUllId1pHcy8ydVAyWGc0NTJBL1dCVDVxQjVRdlpOVHBBQ2JD?=
 =?utf-8?B?UEg3Y1lyTjlRVDFZbDRMMjgvSXZCS1hpVUVjVHlHLzRwRTJFeWV3UXBMamRP?=
 =?utf-8?B?UFAzZFV2dFpyT3lncHhLM0EwanRXQzgzc2p4OTFqdVlmUUZHbGFob29Xcmcy?=
 =?utf-8?B?blBYbS80WHhFS2NqMHJYSDJCbTVpUGliSjFOUXM3N2ZrVVZiTS9CWlcrbjcw?=
 =?utf-8?B?UC91RnFVazYxMEZ2UVNFenBlUVBzWVFpT3N2c3IreW9ZN0RackpNUjF2NDRG?=
 =?utf-8?B?QmhjYTVsT25HMUxhREVtVlZpaS9FMkd6aTgzdHU5V0pMREdqZDNTeDRaYVdH?=
 =?utf-8?B?UldOczd0SUdCUG5ycERFd0duMjFZU0VNM1d2dklzN3dMOTc3OEVsY0htenE3?=
 =?utf-8?B?aUpKenA5MXdMNkRDM0pwQlBZS21LUGJOUUdybEtMRHlER2VUbFBrZHRNelNV?=
 =?utf-8?B?azJLMktBMzJObW5BNmNPN0IwNU5NZ2pBQXRINUVROHk5SWNxblVaajRmYlZ6?=
 =?utf-8?B?Q3VhQmtmSXNDaG54ZUQ2UDRIQmdtVFdlQ211aWU1aWtONVllTEhWRk1xSmdF?=
 =?utf-8?B?Z3Y4cFovVTVmdUg3QnRHWlJsdjdFdjBtVU10UE81RGxRQlBuaFBwYSthQ1o1?=
 =?utf-8?B?cHJGN3FndDZxMmtkTGg4K1NOcU9HbkZaSS85bC9NNy9aS2thRXFpZ2l2eDFx?=
 =?utf-8?B?eHNHaHVQZHY4OXIySFl4Z000d3ZxdTk4cWFkNlp3VUtmRkhPZ3J5c3ZKaDdL?=
 =?utf-8?B?aUJxNnU1ZjVzRThURWxjYy96MkNkWGMySzVUN3ZMbnB1YzcxN3Y5RnV1Vjhu?=
 =?utf-8?B?SHlyU3VZemFrZG16ckEvYVhQMlFlMHZ5bVR4RTVwNGF5d3IxSkFDYTk1QUhh?=
 =?utf-8?B?QkFKL2REMzQ4RFAxemo5U3NySWxKUGZmRjdCekNTaU9UQ2U5Z05XU1lVKzZV?=
 =?utf-8?B?Rk9XaVkrbjd3QnM1M3JEcUZrcVVHSDNGTG5BZ1VxVnJ4OWlyTEI1L1o1dm8r?=
 =?utf-8?B?bmNyR0JiRjBiaVg3bjhYNDk5WVBJMkdaSkxaVFhwZVpJTHlXZWoyWDEzWUxI?=
 =?utf-8?B?blF4c2JZN2xDYjIyTHFIbS9Ha2dMdTY0Wm9PTHBZU3F0Zm0ydDZsTitOUFB2?=
 =?utf-8?B?b2x3cTZtNHBWekpmOUdzcDFTayt1S3RpMkJrdU9jRW03QjJ4TENiN3FvbDgv?=
 =?utf-8?B?TFlNMjdyb3RLb1U4Unl0UGRsTmZmN0JVaVAxVzRKcHplSUtXdFhlSWdiTjBq?=
 =?utf-8?B?ZkVWcHltMlVPNTFsTUw4R2d5TTY5SzJmRnpGUDZnZHFwUi9VZXZHQzhPdHMz?=
 =?utf-8?B?YUVqNktocnNKZ1VZZ3pwamJBR2pLZUVFd1FCOVp4NVN4L2U3azFWaFFhVzhO?=
 =?utf-8?B?Mk1WZ2R6UWhRakVkZDFDaHo5M3YyRHFRSjNkY2UzK0daWTc1WGc1Y1Y3OG9R?=
 =?utf-8?B?VmU5NTVjQ0RwaDZJOUJyb3VWMlR6Zm5uTzlDMDg0dk16ZUJsQ3BnWXBvZFJC?=
 =?utf-8?B?NVJtMmJaRERnVlJBSkJoSVJXL0xaL0ZWVlQ3Nmplb3hLd0czd3RwUnorb0th?=
 =?utf-8?B?ZnJvZVc1SXIxc0JjWHBUdlplWTA5b1I0aVpvTGNTOWkvd0lndzR2dUxHa0dw?=
 =?utf-8?B?VDR4Y2NwZmlqeFR5aURDcytmd3gwN1QxZnAySVEvVXJsbFNITWUvL25xd3Vx?=
 =?utf-8?B?QlJmeUg1aVlPVkNMbVJGN3dwTmZ2WFcwQXNReHBlYWs5RTRreXhHZlEwZ0VV?=
 =?utf-8?B?ckY3aEtyL0JYOWRoTVlqTXE2UWxCSkc2bHhDRkhuSTlPS0pVcS9RUEtTZVZ2?=
 =?utf-8?Q?+bOyVNo4isvbz95kkhJIGfwDO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d3215b-3ecc-4065-7f04-08dd45804ee1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:59:13.9092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTsFcdg24zs4xgWICahUxvnqRyfWyXSnbjgdlbO+rRQYOfstAr6scDVt53Uot8pDjSAXBE0i2EWpdGRIET1T7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10713

From: Peng Fan <peng.fan@nxp.com>

Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
error handling code and 'driver.remove()' hook.

Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/rtc-stm32.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index a0564d4435690313b86669893ec639af90fd6b68..1b715db47160158b3cfc79c437ea956e301deeb5 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -1143,11 +1143,11 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = device_init_wakeup(&pdev->dev, true);
+	ret = devm_device_init_wakeup(&pdev->dev);
 	if (ret)
 		goto err;
 
-	ret = dev_pm_set_wake_irq(&pdev->dev, rtc->irq_alarm);
+	ret = devm_pm_set_wake_irq(&pdev->dev, rtc->irq_alarm);
 	if (ret)
 		goto err;
 
@@ -1208,9 +1208,6 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 	if (rtc->data->need_dbp)
 		regmap_update_bits(rtc->dbp, rtc->dbp_reg, rtc->dbp_mask, 0);
 
-	dev_pm_clear_wake_irq(&pdev->dev);
-	device_init_wakeup(&pdev->dev, false);
-
 	return ret;
 }
 
@@ -1237,9 +1234,6 @@ static void stm32_rtc_remove(struct platform_device *pdev)
 	/* Enable backup domain write protection if needed */
 	if (rtc->data->need_dbp)
 		regmap_update_bits(rtc->dbp, rtc->dbp_reg, rtc->dbp_mask, 0);
-
-	dev_pm_clear_wake_irq(&pdev->dev);
-	device_init_wakeup(&pdev->dev, false);
 }
 
 static int stm32_rtc_suspend(struct device *dev)

-- 
2.37.1


