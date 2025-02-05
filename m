Return-Path: <linux-rtc+bounces-3097-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 925A4A28084
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 02:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7EC9164533
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 01:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF34228C9E;
	Wed,  5 Feb 2025 00:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z+fSu+gt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31BF228C81;
	Wed,  5 Feb 2025 00:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738717173; cv=fail; b=oxDY3hj1dibxw00JyZtRyQHD4cLT3IcvLYTJ57GPXwKP/3zDdgpdepMoBdUQjIzfWpRL6Zzlzp4J8D2eiHYA4UrREsy7ksYN7slYPGhr2FMTgaU/3zalQTpBMljGH0u/f0mWzGFyi9MqUxHlX7p9WWtnYea6UG/6myUdf6h2OB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738717173; c=relaxed/simple;
	bh=gHY2BHYvxVzRpPgRTgubI5fi64I6Ubu6MUDTYIfuE+U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lC9Ai4G13tBTGNONuJQTozEWYqjfxJezBct6SJ52bO4ldyy4ZCjiH9bUy+bLqAxy3DFgDWlY0dLu4rIgXrZ2WwxmVoQG3MQh+tTwce3bCfGnfCHjTCL4c8XaqKOnNLH5N2oLzJjzQXLcbydTRbEPXw/GFjTwVWPJfLSXBZ+HlWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z+fSu+gt; arc=fail smtp.client-ip=52.101.70.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOrk6y517S4CC9KoI4JZc9PwIm2gfEnY3RUeF8R0QS/B3uNB+2ikdLE5PoU9V5v96R8YfsFSV1PGQXR2/mvCjVopadpp/G6GkSsWlIfEHGP9gNeuIbwLJ4+oKi+Mdjtt1ZeY2h2wog8pmKBAxVi5ecAxjVJtNCEQbyjJdDzC4R+f1nj+AgQbGdc1V/5aZbo8dJMMwaZP25oE01IambeDQWeGwnyk0u/Bql+wCzfookFGlG3tmWETzVn/Wplf0iOlkgoDwj5XrT6k0k7id9xLL9P7gyt4mYf6Mfczf/KLm5izvixsqbQk1W2P9UerDSzjzg8BF8+urf/G7A90kEoJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjUzsRVsWfUKGqcMfcInIdzIFU4EDALwy1w62++QsnY=;
 b=zCZlSoKSkEdKsdNMNDQnjgWHaeei49zm2FYwY9dbtq90TqBqUUZaqvMFOpYJ1nNea1J2xHnYb8LCaHfkbsoit4fFOEMnYFC1SXQGPh0G14EG2sF+aVRpTH0x+uszEGnTLqm4SyXlR9TCpKhaoy9xTWIEfjvJgSMwgmf6IB/4WLPN1lifBh5rz+tb9F+pZczM6uW+AOfnTdOobTMN9IYiX2qBukRGdB1MAN9X/ZhK5Kk49KyQsijCEg1WDaVJd9JMIFM2lE2w0UkJb8xyfnLgWOPRDhyvYCz1SqMJJqcql9QHQwoMk5BR6dLhEbOb2fJ78ucDZ2gW9VQw/t62EXA9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjUzsRVsWfUKGqcMfcInIdzIFU4EDALwy1w62++QsnY=;
 b=Z+fSu+gteDrotGKIgbOYNg+AygmbSlPGExKbLnBL8AEMimU2Mr2Z1E/B489yrs+7luKPrQF4nkDZRfV+R0AHK1k8k4ea3x6vVk+97pcZTwPODS37bcYLIrMtHrVueMn652LRrUN1gwpzmVAT8E/5epc6sKI6i255W3ad5nNvDgANEAHMD1hOQDtXjhOGzcDJXwC93ZhPMWPlxAJ72XtEOCYKz9o4G5H+dBVFoEuqEgrurdHYY2D35caL1DbDy6OIDdEQSaxZRbHJ/46LdZuWJRj+vIhFrkHrp0WIdgnCPIgOItHLyRuBTI9HAUMQEO0dsREhcAne1z1cyuSgeV/QdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10713.eurprd04.prod.outlook.com (2603:10a6:800:275::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:59:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:59:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 08:58:23 +0800
Subject: [PATCH 5/7] rtc: ab8500: Use resource managed API to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-rtc-cleanup-v1-5-66165678e089@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738717111; l=1597;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=rISyYCuz8yJRuvtcynWqye8n/ybIJ7leHy6yEB7pHHU=;
 b=Tgu5l+wBrHYt6ouquPi1I0clsMFqBW3OGNogy3BMBCDUGJA8GxSwZLPzDzPbhZWJMga4JUl/G
 w8z4LMcp+qeD/T/P5cfUUm//g/NyGjV8k68wi/yTv036RlarYvDkDKZ
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
X-MS-Office365-Filtering-Correlation-Id: d2c1cd7c-e9b2-4692-3dc2-08dd45805810
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVdtY0dFdUIrbXR3aTlLRHdwcW1IZHcxd2NpdEdPVWQwUFV6TXJRREFZMWVN?=
 =?utf-8?B?clpPRk5rSDl5UlA1TFZuYjNXd2VWZkJ3aHl5VXJOc1dWa05PUWxjMEhpRUhj?=
 =?utf-8?B?SUtjTitqdkZiSDFyR1dOVnVnV3R4cUI1UTc2SEVNWFNUbldUSEVVbXRxaVRM?=
 =?utf-8?B?bm9qK1JHTVczSmtUdzltNC9CMGtObWt0NDhpaEM2QzA3Wng0cXI2cVZFR2FD?=
 =?utf-8?B?UXN3aWVVS1VsOXQ4ZDZCY2VLY1VCRlJXSDg4ZENQSldxSEJjUVkyVkE1ck91?=
 =?utf-8?B?d2wvOVBtOXQzTmpjb2xTTEZQTjVzVERUMm4xck1xU3JVN1hoSHFUMHlDd2Ra?=
 =?utf-8?B?bnAzSldJdU1US1BRR1dCWlUrTDlveHFnTTAvZkR6bS83U2Q5ZXlzTTNGaEpI?=
 =?utf-8?B?VFUzQVlSVmtrdzF2eXhiZ0hkbG54ODZGUFZJb2FhUU10RlpqTXhLM1g4NHdS?=
 =?utf-8?B?WlNQaXEyeUlvY3FpeG1sV0R3WHJuRUYrK1NqckNaUjNFMHZmZFAvYkpVcGdu?=
 =?utf-8?B?bzFyU1FyT1ViblkvR3BmR2NsZlRBWkRtc1J1NDFqWTZ2YkFkSmZ1MXFLMUlt?=
 =?utf-8?B?b1p6Q1B1MHF0NnhuZmZoRjJ0alI5SUViMEpybTU5QUd4VHc5NXd2c0VWUFFL?=
 =?utf-8?B?QmJ5YzhKZ3d1SmpiRVRlUzFkSi9QaWdna0pOMUJrY21XaGZuUmNPb2pwRzhS?=
 =?utf-8?B?L2FaN2pzYnc3bWRBVER3eWgyUW5ONHc3VVpNc3JWbXlIOU9TL21FRUJMdlJ3?=
 =?utf-8?B?WUhRM1JldmE1OHp2MUp0TXgxdXlBRkZBQlNXWGVZSXB3UHFxNy9XMWhZaVl4?=
 =?utf-8?B?THFWbDJ1YkRzVUpVckpkWWE1ZXo0Z0R4bWpROG04ZzZKa3dzZFJhWFlkdHJk?=
 =?utf-8?B?cjcrdTZQMmN3V1NXZGFGcW5BcFh0MHNYbC9Oc21qekV1KzdWNVFXdklkZzFI?=
 =?utf-8?B?dlBjZHlpNkJrbHpTbFFqSnhGaFJYRURlSGNqZ29XNTMwand2eHZNWFFtaFdQ?=
 =?utf-8?B?ak1RdnhOYTl6Z3JEUHlBNXJVV3REbFBqekhBTzBFNW1vazRXa0U1SVhPMzhT?=
 =?utf-8?B?b1REV0tVOGY1Q3NKZFNoZkNaUWhMaDRKS1JQTEJ4eWFLSlR6VDl3VzhuMmZj?=
 =?utf-8?B?dy9RRE0wSkJzOHgzeVpMWEttRG9NVEFsazd3MHhSUnRDTnVNczA0eFVGQmFC?=
 =?utf-8?B?SE5wUlNRUk9KcmV6ZDNOU1JORGlQZml6aG5RQ2hHTmxsd2FiREpvU3FyUVhB?=
 =?utf-8?B?aTZBenJVTEtlejJWR0I4K2ROMmNrWnEwM0EvQ0VydVBYTS9VN1pZekdvbFhN?=
 =?utf-8?B?VWlWR1E2RDVaMHZhUVJEWFRJVFd3NnBDODc1U3lFaWRyR2hPd0pOdTkwaDlu?=
 =?utf-8?B?VitpL3pLWGxnZFNkOXkyUTFab2RXRGRablh4c0QxNTMxY1VZTFdTNUEvR0xP?=
 =?utf-8?B?QVUzMGZ0cE1qNzNzaGErSlR4bzhBbmVsOTV4U3IwdGRSQUF6R3Bib21TbDgv?=
 =?utf-8?B?M1dlcmRUNXEzVmQySDBBVlF2T1Qza1F0b1FVUVFrdkp1c0U2RXRsWUJ2MlV3?=
 =?utf-8?B?UmFseTZaYTBudFMzRmx3UnNXVkFlODNhYzRCNmcrS0dvdFc3MGpIakdlRmpK?=
 =?utf-8?B?cmxOdENaS0o0eXBZVjNHUHNDUTB6OWRaZHhVcHFRS2VlTS9vMjdZRm9JVmpz?=
 =?utf-8?B?QmRVL0dzQnorWFZValp4RmZXa0hYemY3ditSemNUQzhLM2hwQXhWa1YxRG5h?=
 =?utf-8?B?dXVtVHU5cXNoUktyWURiaU1qdjAzUll3WTRBeFo2cVFzT3BxKzM3YkxYQlpw?=
 =?utf-8?B?d3JWdzdJOFdyWDZqeUkvTnoxbEJobG9mYXl3WVl6aUlNTVBRaUpYL1pLZWo5?=
 =?utf-8?B?M296cTlWUDZ1OFp5YXA3VnUraXFob2J2d1E3QU5DSmtpWk1TaUdTTEFBM3dG?=
 =?utf-8?Q?a+moCjntPTbMynp7R4nIULiyVeewMTUO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmF1RURVK2pId1hOZ1BhQ040Nkk3MlhNN3FLcEtGdWFHT2Q4dytiajFNVlNn?=
 =?utf-8?B?aHRUMXp5ZEFSRnBrZ2RsanZBMnppakNVVTQ4UElVc3J0TTdXU1lZZFpzaTBr?=
 =?utf-8?B?TUxXTkh6V1BBQ21MT2V4YXF0ZzAxQUE1a081U1MyV3NtU1pmQ2xyUitVTGly?=
 =?utf-8?B?aVZzWHhWUFYrckM3SFlseGphRWJPUnFYV1FoZktOM202dnltdEErbnRzaERM?=
 =?utf-8?B?Rlc5VTVtSGtub3MvZURwc2hjUGhoN0lRUHpSVk8xOXhZenYzaUV5aDBHaHJ5?=
 =?utf-8?B?VWVUWHpjS1NhTXpzK0xWcU9KdkJsMGExSlhhZ21FdFhWc2dkRjQ0RUhibWhR?=
 =?utf-8?B?TFJpK1BkdGMrYW1Wb2xZM0FmSUhpZDdKYWlsWUVMQVFTSXFiWTlnUEdmRHdj?=
 =?utf-8?B?MjZlUTFpT2FSNVo5ZGliVmhweFh2cVZqcnUwUWJ4TVNrNUhIaVZSb0p2YzFX?=
 =?utf-8?B?QWE4M01qWkNGREhlTkFJRitjM1NRS2dGeUZHV1pjZUxOcXNUSVA1YW5kMXdU?=
 =?utf-8?B?emVvempja2oxNHRqdFlVUEtLUTJ0eEtFMjdLcnZzOHBGaEJtMGhrVTFuazBG?=
 =?utf-8?B?SGRGR0pOay9GeFlua0VxcjA3a2FlbTN3WWNpaW82cDU0amdCTGJ3ZWpDZzhq?=
 =?utf-8?B?TDNXbkdVU3pxNDUwS0VrTjcwQW1uZUsxS09tSDlUbTk3ang2WXFzWDV0RXVw?=
 =?utf-8?B?YW4weFJUdUZMVHNrUU5DN3JIaUdOMlJveWk5QWVCVnptWjB0QisvQks1UTBH?=
 =?utf-8?B?WGFGdUQ0cDdraVhablZDNHpMNGtrUlNYR2xvQlVIaGd4azdURGQ1L3JUWEpT?=
 =?utf-8?B?ZjRyZjdmRVJyTndEZmR0UmhJekhLaFZhNnZmOHBCMjc1MVdjL1BrL3NMSGhY?=
 =?utf-8?B?WnFISEpkMnVkYzVjR0FCcHl5UTBZSmNhVmlEL3dmZGZQbEhuU3g5Zm5ZaFBX?=
 =?utf-8?B?SzJ3MS9KL2d6d1VnN2UwbjlXR1lYd3hHL0s1OHdta2E5L1UybXdiRG9Odmhh?=
 =?utf-8?B?UWJzb3RTeWlZM2ZJQWJFUUtmNUVYaFVYdWdINVBRYk1lSzZaSXo5TUw1WFZh?=
 =?utf-8?B?VnFoL1RLVHhaR2ZIVXQ1Z0FGNFJBdkMycEJCSnpJZG1WK3drMkZvVG8zcTZ5?=
 =?utf-8?B?VE9sYUs5Y2tOSlRQdVlrQnpNY1l6Q2grbVB1a0dUb2dXWHpjME82aE9ybEtT?=
 =?utf-8?B?RzUxZXBFbWZtRldiZGF0Z1Eza2pDZXFPT0hyNGxPOXptcEZ5Q09EWTJnK3Ra?=
 =?utf-8?B?MmpET0srQ2xkNllrMzhLVXZUQ3ZYdTdDUTNzZVVrRVppQ1RpQ3ZsMUxUNVdV?=
 =?utf-8?B?VUVLT3hTWE1WWmEyZmZ6YWx5TUFQQmFqTmhTMVhjRXFjQUxNVTNibnJRa1RT?=
 =?utf-8?B?WUtEc1czRDMrRGNuN0pNQ1VqTTZyenRkL2lsYy94MGhMZ2VKYkhENFA2dTNw?=
 =?utf-8?B?dVFVU2wxV3NBS3RnNE1JcnJQQUtUdWd3SGZXdVFzWFdNYWhvRXBxbmY3c3p3?=
 =?utf-8?B?UGFaejN3ejhCOFoxb01DaEdtbTJhR0YwMGU4TUxsbGlJTDVtVUtFSkxiRGoz?=
 =?utf-8?B?SjVSc0ZNQkpuc20yVjRPekJsQ2lZUTdBUjg4L2pzZlUvODdaaFFlRFAzT3Vy?=
 =?utf-8?B?SzErTVUxRlFiSFJ5SHdvOHVXTTJWTitvZ1BzQ2RQYVBlTE9wMUVYcTlvNmNy?=
 =?utf-8?B?eUFVVVJkZDd0Z3JpS0FLVDZseGNTRmtJSTg5ekJXYVY4VHRuc0tnWnh1UU5t?=
 =?utf-8?B?NkR3TnNNWHgxZlRhSGlDOHJValJ6RkdOL0x2OVZVQzNGMGthMlliQThFcGxp?=
 =?utf-8?B?anFLWFJETG9pYmtMWVRoV09JdHU0Mm9mVUgzdnk4S3kyNlB6VWVQQUxrN2hs?=
 =?utf-8?B?YkhmdzZTSi9RMDJobkNJcWtHQUZpNkxsekRUWUsxeTgvSWl6OXZlUmNlUnZk?=
 =?utf-8?B?VGUyUzN5UFJqMThSZ1Uyb1VXeGFxbldENWN0a0xwT0pXaXpiR2tyVTBCYUlu?=
 =?utf-8?B?eHBWTVZlTS9OZjlXR0dvZENCNjRUMmxmODFISGdzSm81WFZPODM5RmZDMGFK?=
 =?utf-8?B?ajN6VzF5UFFYZnpZeTE4eUE2MDcydVVJc3hiUTZZYlBVK1pLUVZCaktDMjR1?=
 =?utf-8?Q?6LJ1IoPO/Ha9JPgJTFnjmlKgJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c1cd7c-e9b2-4692-3dc2-08dd45805810
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:59:29.3212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISb8CdZQG3+/X2XsvLujU+5uDymRp+r42Uxb7J9IFZzBYyNuZz1fXnjpdD/+X0uacbVNqMUq5NZGESYQukUPqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10713

From: Peng Fan <peng.fan@nxp.com>

Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
error handling code and 'driver.remove()' hook.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/rtc-ab8500.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
index 2dcda96f4a8ef727514c751322b84d8d2b382b75..ed2b6b8bb3bf8f99fef9f8bee9676f71f8a86d2a 100644
--- a/drivers/rtc/rtc-ab8500.c
+++ b/drivers/rtc/rtc-ab8500.c
@@ -361,7 +361,7 @@ static int ab8500_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	device_init_wakeup(&pdev->dev, true);
+	devm_device_init_wakeup(&pdev->dev);
 
 	rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc))
@@ -375,7 +375,7 @@ static int ab8500_rtc_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	dev_pm_set_wake_irq(&pdev->dev, irq);
+	devm_pm_set_wake_irq(&pdev->dev, irq);
 	platform_set_drvdata(pdev, rtc);
 
 	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->features);
@@ -392,18 +392,11 @@ static int ab8500_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc);
 }
 
-static void ab8500_rtc_remove(struct platform_device *pdev)
-{
-	dev_pm_clear_wake_irq(&pdev->dev);
-	device_init_wakeup(&pdev->dev, false);
-}
-
 static struct platform_driver ab8500_rtc_driver = {
 	.driver = {
 		.name = "ab8500-rtc",
 	},
 	.probe	= ab8500_rtc_probe,
-	.remove = ab8500_rtc_remove,
 	.id_table = ab85xx_rtc_ids,
 };
 

-- 
2.37.1


