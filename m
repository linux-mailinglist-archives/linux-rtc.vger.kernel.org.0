Return-Path: <linux-rtc+bounces-2201-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8716E99E497
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 12:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB4671C24D24
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 10:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F231EC01B;
	Tue, 15 Oct 2024 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AFhi0BTW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2076.outbound.protection.outlook.com [40.107.249.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142541EBFFF;
	Tue, 15 Oct 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989514; cv=fail; b=Bp5qNcs1TF/+dvEEgMEwnPv+qfMgf9PfFCIH87CkFEasn52atbGAat/KHDfxctrNm61oTjnrO+XSAA/lQ7eg+x3hPBxcAlZ2PucSB5uc65OtrzrxkKjYPJqfUYPSx0KarzZPBvjlLChw6RfkPCsBWnR0JuIOMDSv5nv8VAwwkGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989514; c=relaxed/simple;
	bh=gPWrcsX0yNgOrxniFUUIpd4R/Sf/rzujv/lnBO6E3Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FhICP9KSTu15QWbazsM3kyI1cZ1eEntjbrdZEroPLuG0BxnWZKmfGfZJ2RJDXCTB5x/6fMedeqhFnqFSCxjsNSgqoydnyc7uI72Fd+qGqXBQCJTRxX9rH27tO9323ssk6uqoS3ELkgDFr+9ZjU/COdrZXIqfn9o9wxpFoFlpNpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AFhi0BTW; arc=fail smtp.client-ip=40.107.249.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7kYcB2YYAntJl7xB1c+9dTWNqqJ9DKuuTiXm97R0rXAnbNQWwsva7tda5TiZNoAqNCtfkEKeHhRYqXBjjBBjmyZrgggEfAEjKJ0mrg7bzyGzLSuHgBlZkFmZzOEu3mS2HBS/uIifLhVr78HajzeQK4DXEQQflbL1AEc5rEpsPmkZ1JptIk874cZ3ga0SLiWJupV0Un45SDat1TALw7gWJ9qFzHPnHGmF0P4mzdgz/B9AaAYNVKeqaF3wuhY4zCJgYoJgrxWsEN8eeCQlnvRr1gRdcZI2KiMg54/Zlr45BQbk+ZluVbzzH4tgmNP6S+vawYYlRk3XbIK4qzvMep74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wh3dxdiFnnlVrzcHjBrhgCcglC+z8h3oypiIHqgl9ZY=;
 b=rV6dKS4N7jgYKuXZ0FROkKY3l1FNe7Y1JGTQvKR6SDbmkt3e3AIJJPaQkwlujKxZv/9653hgMuyk2ydF+Vy3U4j20pZ/JNTq1AXxNwy2MCZ90GrR/xHydN80G7Py91B/DS0ffDN/Ykfx++alEPPJaW04PbzqJgHDRrztxMGN6Y4tUcQx6CTKGHXyvktxVnIF074cXruK7RLAK3xp2hJ4gSK3QDbxYpR9OEE+z59zl1/ljJPYISgJPOvzIxY0pOYvbBIeVPm/5JxlEWu8j1/9mR8NMzNODYOuJohddiFilQCoAZKrfRtJx754EMdppqKsyeZ1XweLC4zHCfismKqp8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wh3dxdiFnnlVrzcHjBrhgCcglC+z8h3oypiIHqgl9ZY=;
 b=AFhi0BTWTEB36M4gSjoPOoeVve4+7wT4+BjLaBROrh+tXi1Lq2XMsxccnlzxq27M4qFWu8jKKxsHWXDi0CJyM57/vsJCujI5NqqDubVSjucfrAzFozU9aZfdFEGffmSrXFseFnpqS6izLKYLvC+4wvBGpk1InAyieHyz0LhWECXVpMFGtejj8Mt0amQ4FDF2MJ13fe9a9SGF62YmzwiLMI4JdU+K9yCHc7gnAP7PricmjXuOYv6Gpu4ipTkH28iM0wXLkznzFoybOROz4iUGi+r6komIbg70Wwvygd90XVKxMYH29UMEtut+jeYu/jGgTX/Lo0V1di6n8B7ieJpkfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 10:51:46 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 10:51:46 +0000
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
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v2 4/4] MAINTAINERS: add NXP S32G RTC driver
Date: Tue, 15 Oct 2024 13:51:33 +0300
Message-ID: <20241015105133.656360-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
References: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: d805810a-956b-4dea-309e-08dced075ca4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjF4UiswOGV1RklZajU5V1Y0QjZieWJKSThNQWFXalpLb2ErSUE1SEVPZ2JG?=
 =?utf-8?B?YXJOM0FpTmxTT1ZudHl4Vk1IclF5QjlJVzcvNWZoMkNFUi9IU1Z4QjVpRVIx?=
 =?utf-8?B?NW1KS0tuRXlpcEZQUzVJZ0lRSm1QZ1dxdjJ2ams2UmdmUDJmV211YVM4WWRK?=
 =?utf-8?B?VHZ6RWJLTGFrMUtTdDNPUDVxbHczZWZyUWJTWmMxM0VnOWZ1VEI4SHJZalpF?=
 =?utf-8?B?QnoxVWhyOWZySWhRQThwd000LzkxbDJHbUh4dzFHd2E1elRuWWhhd1A1aUQw?=
 =?utf-8?B?MXFsZ0hPNmV5dlhhVnY1UDlzUWZUM0hRaE5VSGVVckN4Q0s4UzRLT0VOOEpT?=
 =?utf-8?B?NE1oaHpmSC9Oc2MzRGdXengrN0lURk9Na3lYWFNDRWVPd3Y5YytoQzdodVFy?=
 =?utf-8?B?ZXViUExkY2NGU2h4dC9GNHJkWGVKVkswMnE4Y3ZPYVE0RVJXSFJ3VExMUlpF?=
 =?utf-8?B?NS81TytEQjNtQUdYSmsvaEQweEpOV01kazIrdlhwNEswQzVlOExDT3VUQ1hq?=
 =?utf-8?B?S0RLK2JxbWNWeXBKT29BUFVHRE9Ra3hUeTVRNU9Sckd4MjMwMjJJbGw1Z0NQ?=
 =?utf-8?B?SHJVY3NvOUpNUmpncytOZVpjZ0NJWk9jdTVNZThOSlNxd1prWWhzWlVtTTBP?=
 =?utf-8?B?akUxUnF5b1BUR1pTSXFJWXBEdnl6Yk9vK25SSE5DT0FFTlNvMDJ0UHMxeFlW?=
 =?utf-8?B?cFU5eld0VXpVR3Y5eGZKcHFxNCs0eVlkOWQvN012dGZtc3Q4WjV0MHhQM0Mx?=
 =?utf-8?B?T0RRRzJPQmRLL3hvWU5QYVloOVM0UGtwbUdsTldvMld3WG9YaHZDcjZ6cGYv?=
 =?utf-8?B?THpWZFBXb3d4a3lLWGx3a0lCVjEyKy9MT1hIM2RlbHM3ak1oemoyd0FNSUNQ?=
 =?utf-8?B?QXFiME1JSGxrcGx6ZUVRYlg4SjhOczEybW05WWRxTncwQVZNQm4vdnB2WGlh?=
 =?utf-8?B?bFliVGVrT0xTMlNJNG9YSmoxL2VtS1NrV3Zwc2FJbExrNGZlRmtZR2k1Qmlo?=
 =?utf-8?B?cmh6bTdNSk1kNm5WeVJJQXVic2dkdCtXUEV5UHhTcnBBd29ZQlVkMVNJZVFD?=
 =?utf-8?B?UWtlVUtWVWNEaWRsOEVOMjhjSjlhZHJ4bE82aDZrNys5aXgyL0JpZ3ZRSk9G?=
 =?utf-8?B?cWdFQW1DOTA0QkRTOWZwMC9kQk9jZ2FlemxBZ2pEa0IzVzlQUWxPZkRqeVJB?=
 =?utf-8?B?dzhWc1ZVUVI2cHJKb3UwcUphalBRTU9KVUxpdlgzanZ4UDNURW8wYkRncERU?=
 =?utf-8?B?Y2VwcHFCS1FsR1NGWk9vMnJ6MnJaTVFCMUFCMG5MOFRodlc5WG94QTZiSldZ?=
 =?utf-8?B?cm5mem8vOWdqWkVFb3E1M2JaSytyUmkzYUVIZFpLMFVCNlFobGc0bHdFWXBF?=
 =?utf-8?B?L0xVaWJDS1RlOHluYlMzWG9wZ01mNkNnWWdTOFZJRXRWYVVEa3pvVGdUZDZj?=
 =?utf-8?B?RW41Smg2cXdUT0ZlWURyd2preVlqUWNXM2NxdU1UcDM2RWFJWUx4dFFWVlhM?=
 =?utf-8?B?MEhFaWN5amV0Qmg5dkp0d1lpWVNxaWpGUU1hZDFveG5GekhSMnNCS2haNlNW?=
 =?utf-8?B?eDdWc3hmNy81WW5BUjB3VmZUN1dSYlB3Vm0wZmlLdmhOWmhTWnFHS1F2SFBr?=
 =?utf-8?B?K2Y3bHh3TWROZE9ubFhQNWNIZlhRalg5VG1xbmMyeWhzaXdiWTUyUG40V3lK?=
 =?utf-8?B?M2htMjNmbHdDOHpiZjNIazk4b1pIUjNLWGZNeE5NRkF0RVhxVDd6QVJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUNTckJJbGFKVDlMTWkvMU9sekIvODZjc3E5bHlNR0pLZ0t2bzE4K2oycDRC?=
 =?utf-8?B?R2hwbndHaHBLK2hNN3QyZlp2ZnMzSVROTU1SWmlTWElKQ3NRVHprWnN4MFBW?=
 =?utf-8?B?Q0lJczkzOG1RT0wvYWlmNHVWcWh3M0xCRURjSnhHbXVFVFp4K2NjNEwyazRz?=
 =?utf-8?B?K0s4dkVOSUwraG44Z2ZsV1RSUnF2bG9rOERGMzhnVXF6Q2ZMdnlwLzY1Z0Ra?=
 =?utf-8?B?OXNTak1EMFVsOVhldk1QTE9yMGZVdjR4b1V6ZWs5bHBuQzJ4SWgzRkdFTnVR?=
 =?utf-8?B?cW4wdjZvR28xWnI1dTEwY0wrOWFoVzJvMTJHSkI4SWxvV1lqeFMvYURPemtK?=
 =?utf-8?B?TFZSQU9YNmRPdklPcERrbHgveWludmRXcDlJZU9KSXFQME5ZbmFkRDdRMnVu?=
 =?utf-8?B?YXZHRlV1ejVyaVVhZG5GN05tOXZLRlhGN0Q5S0hEQzNpUUdIc1MwOTdkSmor?=
 =?utf-8?B?c1VuMGxVRXN5c1ZCYU8vQ0xrNW96L1lhWTJKamR2UStMWStFSGZnTG1BVG5D?=
 =?utf-8?B?dGdaQnY4QXZycGEwMjd2aUdrLzlMV0d1bXZEZzdIdGtEeEFWVEl5Uzd4Y2Uz?=
 =?utf-8?B?SjRJbTdmZXIrMXNkdUpESVBVOXZkc0o5bGJQZ1JMU25IemRrVjNQb3k1OFFT?=
 =?utf-8?B?Z0g3SG90UkhqMmNCS3hCdUhLdVY0eWkxR1RYWFpnU0svOHBhaGR1N2JHNms3?=
 =?utf-8?B?WmVxTisxMUJ4RGQwczA2QktDM2srR0FoNk90MzFXd2JvbFpCdWszU0t5K0Nk?=
 =?utf-8?B?Y3RFdnJINW9pbCtUOGVMc1N5SHp5NmJKbWY0bzA5aFBrVDdzVFRwZzYyOEZU?=
 =?utf-8?B?b2t1clQwV1YwTXpqOUJ6dkRjeDkzZ04wMEUrQ2RyRklGeXY1OEMrN2Z5eHhH?=
 =?utf-8?B?ZXNQd2JTczBmL3o5bnRCR2JJT3RFSjBOUGZCQXpMRXhTMHlkQ3VXUTdaRkZO?=
 =?utf-8?B?YkxnZ3d4UlI3R21hVllmV3c1YUJ4djErdG53NzlMK01NeDBKVm02Zi9aWlFu?=
 =?utf-8?B?RWxlNFJVOWZseUllLzFpU29CdmdWMExneFIzWjJVR1BNUGNOdkxUZ2IrZ2Fj?=
 =?utf-8?B?VTM4c0RrVVhKWGtrbldLSnV2Y2ZOZDBzTkpEOXZxK1d4b2t6K0RjcXpaSW1D?=
 =?utf-8?B?dVZ2TkkyUC9ob2VmY1lnTTFIKzVlQlJDaVVzQkZZT0NUS2dldWRKdkVvUW85?=
 =?utf-8?B?bjR2K3lhaTYzdCsxZjNQOHhvaDVzZHJQN2o4K25nUXdpTHQxei9jQ2xKZ3pO?=
 =?utf-8?B?Y2lOWlZBMDZVRWp0WTA3cG1HYlN2dXE1NTgxWUI3VTM1RGVQWnpxTDJibWdW?=
 =?utf-8?B?b2duMzB5SEhFSjNmcEk3b3dTUWRhQlFkVzk3S2RSM1lKdmdyWWZGT0pPSWtX?=
 =?utf-8?B?UUcvWmx2TDhIZmFic1lZQklYSXVIL0ZMNFk5KzdUZzZHTG9kcW9xUmZ3OXNo?=
 =?utf-8?B?NWUrcGt3Z3ZFYnVNSjBxSmhEbmhjMjA1OG51SFBtTjRwNkpRS0I2OVE1ZjJ5?=
 =?utf-8?B?bjhMQlZUQ05ZREtpSVFnT3h6b0lkZDgzYWRCdmNjaEFkU1FtZHZHdElLZ1B0?=
 =?utf-8?B?WGJtTG9oR212eGdpL0gxRVRsLzY1ZGh3V280Y295RnVNSVFOZmYrMTVNOGFv?=
 =?utf-8?B?c0ZYSFZ0WW1kME14aGROdlRLN3NhcHpYdGJIc0JaOGFmN25JaGJjemJZM1Jw?=
 =?utf-8?B?aVJaajlxei9od0Fpc2RsWGtWVGZsSU1LUi9QZ242dTZRemFMQ3hwcnBhQ1dx?=
 =?utf-8?B?UTNJcDVBRkNDT09FQVZVTnVielRjeVVSbnA2OEVCTnFodnNFM1AwclRCZ2Vr?=
 =?utf-8?B?R3FOVXQ1cUdHTXRkMk4wZVI2Z0FseGZDNGVYeVZVVU1ZWDREL1JHemUrUVV1?=
 =?utf-8?B?K3RydENueVhCOUxYWnh5RlJOSUFNbW0wOVA0cm41YXFWdFc2WmxJcjNjYTVQ?=
 =?utf-8?B?SzdEUmtpaXZRYnUrZG1CY1ZMYXVZWll4SHBGZDFhN1V6czhRNTUzNTVlaEhl?=
 =?utf-8?B?TWJ3TDNDLzFpaUU2VlhFV29ZRnBZK3pJbVBrTTBSRVFNKzd1SXJEM2tPRnd0?=
 =?utf-8?B?eGhnQTJFSmJLMkxCTHZLMmhCWkt6aEdZLzNReHFJWlR2LzJxcXVJVUlHWGZi?=
 =?utf-8?B?aUFtd3hGREQ4L1dGR0FKSWNiSEdKaFQxZGxXWlg3QjBVck9zWnVJSEdydDh2?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d805810a-956b-4dea-309e-08dced075ca4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:51:46.2292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYJqJ+emzUirV8xZmQVqLtEmpn0ohwvWPgZKQcKrU289A/cxwqCEjyywFpvgmp3X5LqrujiisHfwMOml0uPZJORyAMOuBQ5WHB+2/TsPVIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add the NXP S32G RTC driver as maintained so further patches
on this driver can be reviewed under this architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7bfef98226d9..991a9df6819d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2763,8 +2763,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
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


