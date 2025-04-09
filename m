Return-Path: <linux-rtc+bounces-3849-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AC0A827C2
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 16:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E3CF1B629A4
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 14:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC5E25E836;
	Wed,  9 Apr 2025 14:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mYD/iziE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4421415ECD7;
	Wed,  9 Apr 2025 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208774; cv=fail; b=tguCKUbLU0oOhqU4b3yUhFjLZPTI/JdgUt/Yba7usCcA7iZPeSWYUlLzAZsip5pxVu2Xa+XyopVnDpFlv241gUzVIobynCBb21FA/4UU45BcvNoQsIdckSW4nCSfxIAwoh8s714NlprOaKV4oA0f4JBkrjqWuj8z4oKYJMH1xLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208774; c=relaxed/simple;
	bh=5t+gYuN8qvc2B8M3J4a+XUh56ryAUD03o3ncQv5AywQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AxMewPqhS/A6UotYFduIZGNH6ehX+7tz2irTrQKFgPMUa2Y/LwBiAw2Oma/oHUZsuOclkSC94bTopqNn3LnSk8b8xlsKu/5yzrBR822snLJ7dtMpmIc+dG12HpNCIiGfr+cGRUQFdw/weap0nwqVCTifRzcwNzgCXDX/BHqk3s0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mYD/iziE; arc=fail smtp.client-ip=40.107.22.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfPyWYlqJeF2+qJnAUI2noqh4I9XxIfg0rsAxAN+S/qwnC+2l/I5+cGWF4G7Z0HwD8D47m5wvW+ybyGCBrcmVboto/+DfyK4mgrYDyna4yaEN0lqsSrYWnI/SQ+23NhJmyMiZU43EDFpCcyoTVELXR/rYUfgxVx1ZwfjP+0KZzBWZAAqqygqRzKKMgRwlmtReFSXdcdR6wssw6x/3/0Q2IJRqY1kHlHqrDl6El0NIuMsVdWwvBHs+Ds1FrgjM0KQFlnK5q4bJZvunTdV5Szri4Oefc6uj1ZnXjqt24sxXzW7P9puhoJj5HS3mgrG1whcLNfGotYAe6znaAT7O8YtaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpMcH3KcvJYYcwjk7sWpW/J74oxHOCVf4laqYgRSSPE=;
 b=v4Ouab3KdagzzXRLPMYU3KOYL0DLMoNVLJtQsMc/Ju6a/eC12t9JEhugY0uZtQPdz9eMR4CiQR9ooeJw9z8IdKGYbcMi5fVndPryHnOhwJUq2gQXckl1Huropho/bVm2JL9aL1Dezuy4MtslkswM54piC9oR4R8REMY5SYQEXFIX/7J5KHAb/vOQYrBwyEV0aCEMkI8+CatBzSIUzQqM/BC6hcF6szvqTSaxrLS7rSska7rFP+C0Y8rz6Ub3m+prQcr4CYTMmweiG1RwMAXE2QEE4TtwwlutabKv1ZQq+/1uFoZs22Py0SVVjGrtCVzK/L0/uHzsd6VonLKUl0fbEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpMcH3KcvJYYcwjk7sWpW/J74oxHOCVf4laqYgRSSPE=;
 b=mYD/iziEV3gfoNMHtHcevmp1xp3fIaFP9xp/UjaGHqBgmh74dA4f6GaTb1VWgUTn5r/HGsijGJ0XnKVwE4hQmG4HkAR0yK50cwC+KUCSW5Wjbc+huws5ZgK5ttscNfrFHhNQr9PCjFGoNa0exIfW6wJzOn+RDtbRfvLbq9lnOhqEc3YPBrBb5uijAWBIaTe7VxvBktxeEnF43ZuMDg2YmF4PJLk0nAsUMZ0/V3JbRSiFHD8nPLxpVTIN1lVTWKi/rklCa13xnHXc/alD9+aGw4TjWmSfjEGkRz3qYTaLo/LmTujIuo8oh6UgNSbF/q1UTlKZVQR1c79coLY6gMawvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA4PR04MB9566.eurprd04.prod.outlook.com (2603:10a6:102:26c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 14:26:06 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 14:26:06 +0000
Message-ID: <9f982548-c5e3-45ed-963a-afb5256acf31@oss.nxp.com>
Date: Wed, 9 Apr 2025 17:26:01 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Enric Balletbo i Serra <eballetb@redhat.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Frank Li <Frank.Li@nxp.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
 <20250403103346.3064895-3-ciprianmarian.costea@oss.nxp.com>
 <CALE0LRs3VA9kLy4QSEOBCixZbptW4B4DVjZqbN=GDoONHq2oeA@mail.gmail.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <CALE0LRs3VA9kLy4QSEOBCixZbptW4B4DVjZqbN=GDoONHq2oeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::18) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA4PR04MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 7816ee67-e8ea-4841-fe6c-08dd77727689
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkczS2UxdXluUVlQcWRtT1ZFQlAvcFNhU0JYN3lHWU9QVFV2dGlpNHh6c25M?=
 =?utf-8?B?UVZQMjduK0x0MEZVZlpjc3BpU0JsYys0UFdaeXU3dU8wZzhWL05PclRBM0dw?=
 =?utf-8?B?dmd2Y1dzbzZjVGJKQVlnbkFhd1pvNTNxRllvai9KL3kwbzUyZVpoVTF0U0dH?=
 =?utf-8?B?elZQSWxqUFNFSyt3eGg3WUF5eWwyb25EenVHRDF2R3NLNVhXM1ZGYjI1RW0x?=
 =?utf-8?B?U0h2VnNZTFFpTHNNcGtZVHREM3FGVWpneG1sczArYnF5d0RoK1czNkZYUmFs?=
 =?utf-8?B?NVpIZUR3WU9mVE9Bd2tYMlIycWtmdE9tcTFxTGhuME9sSkhKRE5XaW44dDMx?=
 =?utf-8?B?YkdFcFNhOGxIUE8rMk9saXNnMWxFa24reVlkd0VPakhpVkxvUVB6czlpZWd4?=
 =?utf-8?B?bmh2S2ZBMXlFdE9PeThVcnViTmo0SnYwN0JFcWI5RXpsdlgvK3MrczZ3M21P?=
 =?utf-8?B?UTBwb3VvV1F2aEgvdHU3TFdsbFc5SUhoeFc2TU5Kbk1WS1pSUkVtdnR3ckpy?=
 =?utf-8?B?Q2hJYXRhRkxpUUtxVEZGVjNVZUFWQkJJMVFTdXdRZ0VJcTlOK2NRc0pZQS9j?=
 =?utf-8?B?amozLzdTMjRGZVNYeXpXb1o2RW1PYStCSEwyNFlRekJiWUJGcVo4bjY2Qmtn?=
 =?utf-8?B?N1FlRjV1WUxsWTdDMDVZeFprS0w4S3U3VWM0NUZIdzBNU3hVTzlzbWx5WC9B?=
 =?utf-8?B?MXlWdHZBRXU1VGNVckRaLzVUSjI3YStKNFcwMC9FTkV5OTZ0bE5icjVTS1VU?=
 =?utf-8?B?QUVocU4vS2NsZW1hMHZyanB5MU1YeDdObHcrMkRucnY0Wkl2dTVYVUtHUXNv?=
 =?utf-8?B?cnFqMWgwNldhczdZbDlYR2JCTWIzbktPdm13MXZEcFEzM1diNzY0YTNITUNj?=
 =?utf-8?B?VjNVUWhGU2N0VkJmaWlBRG0wNnFsVFJ6OW95ZXFXNnFaUGpFelFudGM3UVF3?=
 =?utf-8?B?eVB1OTczeVNxTVVzbklocTRaT21vcHpjVmkvNDZhVDRHK1FkRDFmSlZvdTZO?=
 =?utf-8?B?MThCbmFkcVp1VEhsRXRJNWxwTS8vcUlWWWhIMm1LOEllNEEyZElSR1VTS1o4?=
 =?utf-8?B?S0tyTzNxTTQ0SEt0MUYxK3UxdEZOdk9GbDdJQTEyYm9Pc2RLVmhOK3BTSU9C?=
 =?utf-8?B?RGFpT3VaRmFiN2c3ekgzRmxiUWdCbzd4TWNDa3FMWlZXWTI1MENUdEJtYy84?=
 =?utf-8?B?aHV1aDFWYks1RHdHcjNKalQvZDI1R053K1A2QnM1dGJ1aUtQZy9zZ3IwWCtJ?=
 =?utf-8?B?QUhObkVwakFHL1hGVkU1TnpZSXVDSkExNml0QmdNU3Q3TURhQXlVSGc4YUhF?=
 =?utf-8?B?aUpEakFjUnR4V1dtSVM5VVQ2WHozSlBPN1RmSUNWWE80eWZnakJSZG9paFJ5?=
 =?utf-8?B?dmsxamNMYTNjTDExeDZwMTZMSVZlMjk3RUhvUmdZY0pLa3FNSytqTExtbE54?=
 =?utf-8?B?eXlaOWp3NVJPTWgwbVp5dXhTUDVSQStxS2FOSWozbW9Pb0dTLzcwcXBDYUgv?=
 =?utf-8?B?RG5KbEI4RE1NQzZvQlJiWGhNckw3d0UxL2Y3L1JDZ09tbDA1K3RqUExkVFZU?=
 =?utf-8?B?cHphbHpJVkJETDY5SHdQWUtBZGkrQjBvRnRJM09IRjd3bkhlREYwcW5TbUxX?=
 =?utf-8?B?U2twZTM1MmhpU1kxT2pPVnR4UHFsT1A5ZFBoQ1FGOVhVNDlFdTMzMXRYcEp1?=
 =?utf-8?B?ZFZvK2p4MXpDbDdMbWltK3ZpUU1aVWFJaVFzb1pISThqYUF5QnI2YjJUb2Vr?=
 =?utf-8?B?SWtyVE5YeVVYNXVsbWY0MDIvQ1AwK0tDSDBPQ2JscHVBVTE2QWZWYlZhajhG?=
 =?utf-8?B?bzRrcktjRVAvcHREbGtxZlo4dTlNU3JtMVh0OHZVNml0R3o2eSthUFVreXJj?=
 =?utf-8?Q?ABX3gxnpMoWXD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clZoZkpQYUorUWVUMGlBQk92VGRMQlBSdEtINEp4YXc4RHdrbmU3ZVdZSjRh?=
 =?utf-8?B?TUEvOFhDcW5LK1g1bVA4N2l4ZmMvMTJIdlpEaEhQTkJLRWoxR09uRXgrdllp?=
 =?utf-8?B?ZWo4WEsyMGdMaFRFVEtwdlpWbU5BNldJVVpxMzI3SkNIMkhRYnRTNG0reFZD?=
 =?utf-8?B?U25LYm5tQlUrYUYxTWZ0Y3VlQXFQR0p0aUh1K1YzYXlxVjNnMFFRRzNUVjlO?=
 =?utf-8?B?U3FWUFR3aU5renpyM2hGMU1VcGJRK3JRMTBrd3lkUkxWeUYyRlZVSEhTdEhp?=
 =?utf-8?B?eTRjTWhHMXA1VGRmZkFLSm1uWno5NVQzK3JNN0tBREZPQURGTkZSbnBLa1ln?=
 =?utf-8?B?Y1NZekgwNnVQQnNtY0xtYzAzenoyTTMrNmtiSkoxcnFOSjRKSndoUDdwT2hk?=
 =?utf-8?B?dzN4OUZleEcyNEpLVFA5TzJZQjNmdGwwR1dOVDJjdmdNQldna0RwMXErM25S?=
 =?utf-8?B?S2ptNGtnOCs3RVloYjhjelJlTlU0Q3hGWTJibXNZNkhKL3pOOWpLaW81ZnYz?=
 =?utf-8?B?Sk85TW8yakxHS1J5bVV0UnlUa1c3QXU4MHp2b3ZydUFIb2dmV09reEFQbXpE?=
 =?utf-8?B?UDE3YkxVMTFEWTYraWlWWEJ4QjNXSVd2N0p1bHRWQ3lFQURSSUdIOVlqV3Zm?=
 =?utf-8?B?K2hBTmQyeUJjSUplRkd4NUtvV3p1M1FxZ3VmWnlndU94WTVycEVnNWpWU2FY?=
 =?utf-8?B?ZUduc1gzWDZVL3FtdmVnUkhHU3RiY2VvMTVJQ2c2aFpKckdJOStONFRwWFVW?=
 =?utf-8?B?SitzZXprTG9WeVk3SzhVSEM4OGhGdHdUbGYzemZINGFkN1BiclNLSm9kajht?=
 =?utf-8?B?N0FTTFdOZm5mOVRyS25KbFdSMmh5MHA3dXdmOVdURW9aTDQ5NTE0Um95L3RV?=
 =?utf-8?B?Y1lPUVZSRzlWZG0vY1NxcXBIb3ZJOVhEQkg4dEVGWTdQaDZnenozc1Y3RENG?=
 =?utf-8?B?UnlBQm0xUHFPY1ZuRjNIUDVvNHlrekhYRU8zcFBDUHRrR3A3anJ1VTVYcWx5?=
 =?utf-8?B?N1BNOFMwc3hKcndkV2RueFBNSkJFay9lWmV1TmNLd2JCRzVFdXNqNzlYWkdW?=
 =?utf-8?B?eE1rRUEvc0VvenVCZkJJM1o4TE16YVg3ZHcreDZWcHRPMG5PT0dSUVh6VXVU?=
 =?utf-8?B?ckdVbzgyMndhTDIzaG9tTExVRGNjT09IZktlK1FtOENKTmJFTnR5R1ZweVFJ?=
 =?utf-8?B?MzVuSE9lZmQzSWFVYjlMc0N4THN1dERWUDhveUtpc0dqSEE0bEdzVWZwdWtt?=
 =?utf-8?B?Si9NbjBUSXJ5UGk1UHNZSWVoWUlWbytRQWZpTkc4UnZCeHhTeFRNb21CY3hm?=
 =?utf-8?B?SmdoaGp3djZYbkVsTGpIUUl0Z3ZSaGRxM0ZLS1l0a0x0TmpqK1RVVUxWMk9M?=
 =?utf-8?B?SnVqN3BIbFppR0JXcUIvajBuNG1qRTB1VHh1d1RHdTgrNWR2RUM3VStxdFd0?=
 =?utf-8?B?ZzJpVDg3NEVEUklVYkhQOGV0T2swbTRzaWJ4ekQ2ZG52Y3gwYXkwUTQvWjFp?=
 =?utf-8?B?eVZMYXUyQWtpdTd6REtNbWY2RlBzMFZ3QjV2RndYdkJjTkJZWmJvR1g2SEwr?=
 =?utf-8?B?WEhhdXEvVDhDeXdUWndJbDJldXFMWUp2cEtCa2dMNngzK3dNQkp1ZVpJV2NP?=
 =?utf-8?B?RHZGdVhJc1NMN1BqRE52VFltUDJDVW4zZmVtd1FkZks5anlOOUZDdkIxUi8v?=
 =?utf-8?B?S3loM3VSNkJMc3d6bEFKa2hYeC9WWHd5NnAyMVFmT1VTb29XZXY3UUFlalZX?=
 =?utf-8?B?U1RXMnY3MDI5RTBvSjR3MUowTTIreE9XK01VNVBjR3I3WlJCOXFqQ003Mzdn?=
 =?utf-8?B?Z3R2d0dlY3VXMzVlOHdtcHBKSnc4c0V1dkI0SGE0WmlQdUpka0JwV1E2dlNa?=
 =?utf-8?B?K2hNRjV1aWlYdFIrRVdVdU9xS2Q4WlhlTGZLSkgybExXNExRVXZHRVMxUVha?=
 =?utf-8?B?VStVUDFHTFdNVHJzTTVtQzU3YzJuQkNoQ0padEFnank1Sk5kOHFqYzJiWHN3?=
 =?utf-8?B?NHZBY3hiTENsRzNSelNmcCtncGNlMU5LcUJoWXM1ZVBydzVNVERYRFdLTXZv?=
 =?utf-8?B?UHV0ZTliR2Z6dUlkUTB5UGFsa0lyZTh2R1YxTzdyYkVobTNQMHhQZUI1UzZF?=
 =?utf-8?B?YzZCYitmQUE5WkhsOGMrTnZxSUs1VVZkSGdmd1VRS2xXdE1tbmtrb09Iam81?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7816ee67-e8ea-4841-fe6c-08dd77727689
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 14:26:05.8879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrOzRa4V/OGYZnq8QH63kSzL67LOMja9/GmTdxJkHgEn3UD2xbtT97ilDKzJq5o1V13QjVcHGTYlmmWnxSFlxuwzNG2Iutg5rc0ADKDE+uI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9566

On 4/9/2025 5:14 PM, Enric Balletbo i Serra wrote:
> Hi Ciprian,
> 
> Many thanks for your patch.
> 
> On Thu, Apr 3, 2025 at 12:34 PM Ciprian Costea
> <ciprianmarian.costea@oss.nxp.com> wrote:
>>
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>
>> RTC tracks clock time during system suspend. It can be a wakeup source
>> for the S32G2/S32G3 SoC based boards.
>>
>> The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
>> alive during system reset.
>>
>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> I went through the code and it looks good to me, so:
> 
> However, I did a basic rtctest selftest in my S32G-VNP-RDB3 board,
> and some tests failed (it shows a small deviation), any idea what
> could be wrong?
> 
> This is the output of the test:
> 
> # ./rtctest
> TAP version 13
> 1..8
> # Starting 8 tests from 1 test cases.
> #  RUN           rtc.date_read ...
> # rtctest.c:59:date_read:Current RTC date/time is 28/01/2025 00:17:49.
> #            OK  rtc.date_read
> ok 1 rtc.date_read
> #  RUN           rtc.date_read_loop ...
> # rtctest.c:124:date_read_loop:Continuously reading RTC time for 30s
> (with 11ms breaks after every read).
> # rtctest.c:151:date_read_loop:Performed 2638 RTC time reads.
> #            OK  rtc.date_read_loop
> ok 2 rtc.date_read_loop
> #  RUN           rtc.uie_read ...
> #            OK  rtc.uie_read
> ok 3 rtc.uie_read
> #  RUN           rtc.uie_select ...
> #            OK  rtc.uie_select
> ok 4 rtc.uie_select
> #  RUN           rtc.alarm_alm_set ...
> # rtctest.c:262:alarm_alm_set:Alarm time now set to 00:18:31.
> # rtctest.c:282:alarm_alm_set:data: 1a0
> #            OK  rtc.alarm_alm_set
> ok 5 rtc.alarm_alm_set
> #  RUN           rtc.alarm_wkalm_set ...
> # rtctest.c:334:alarm_wkalm_set:Alarm time now set to 28/01/2025 00:18:34.
> # rtctest.c:353:alarm_wkalm_set:Expected new (1738023515) == secs (1738023514)
> # alarm_wkalm_set: Test terminated by assertion
> #          FAIL  rtc.alarm_wkalm_set
> not ok 6 rtc.alarm_wkalm_set
> #  RUN           rtc.alarm_alm_set_minute ...
> # rtctest.c:394:alarm_alm_set_minute:Alarm time now set to 00:19:00.
> # rtctest.c:414:alarm_alm_set_minute:data: 1a0
> # rtctest.c:420:alarm_alm_set_minute:Expected new (1738023541) == secs
> (1738023540)
> # alarm_alm_set_minute: Test terminated by assertion
> #          FAIL  rtc.alarm_alm_set_minute
> not ok 7 rtc.alarm_alm_set_minute
> #  RUN           rtc.alarm_wkalm_set_minute ...
> # rtctest.c:464:alarm_wkalm_set_minute:Alarm time now set to
> 28/01/2025 00:20:00.
> # rtctest.c:483:alarm_wkalm_set_minute:Expected new (1738023601) ==
> secs (1738023600)
> # alarm_wkalm_set_minute: Test terminated by assertion
> #          FAIL  rtc.alarm_wkalm_set_minute
> not ok 8 rtc.alarm_wkalm_set_minute
> # FAILED: 5 / 8 tests passed.
> # Totals: pass:5 fail:3 xfail:0 xpass:0 skip:0 error:0
> 
> Best regards,
>    Enric
> 

Hello Enric,

In order to obtain a better resolution/precision you could try to only 
use DIV512 hardware divisor instead of both DIV32 and DIV512.

Regards,
Ciprian

>> ---
>>   drivers/rtc/Kconfig    |  11 ++
>>   drivers/rtc/Makefile   |   1 +
>>   drivers/rtc/rtc-s32g.c | 385 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 397 insertions(+)
>>   create mode 100644 drivers/rtc/rtc-s32g.c
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index 0bbbf778ecfa..510dc2db745d 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
>>            This driver can also be built as a module. If so, the module
>>            will be called "rtc-amlogic-a4".
>>
>> +config RTC_DRV_S32G
>> +       tristate "RTC driver for S32G2/S32G3 SoCs"
>> +       depends on ARCH_S32 || COMPILE_TEST
>> +       depends on COMMON_CLK
>> +       help
>> +         Say yes to enable RTC driver for platforms based on the
>> +         S32G2/S32G3 SoC family.
>> +
>> +         This RTC module can be used as a wakeup source.
>> +         Please note that it is not battery-powered.
>> +
>>   endif # RTC_CLASS
>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> index 489b4ab07068..e4b616ecd5ce 100644
>> --- a/drivers/rtc/Makefile
>> +++ b/drivers/rtc/Makefile
>> @@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)        += rtc-rx8111.o
>>   obj-$(CONFIG_RTC_DRV_RX8581)   += rtc-rx8581.o
>>   obj-$(CONFIG_RTC_DRV_RZN1)     += rtc-rzn1.o
>>   obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)    += rtc-renesas-rtca3.o
>> +obj-$(CONFIG_RTC_DRV_S32G)     += rtc-s32g.o
>>   obj-$(CONFIG_RTC_DRV_S35390A)  += rtc-s35390a.o
>>   obj-$(CONFIG_RTC_DRV_S3C)      += rtc-s3c.o
>>   obj-$(CONFIG_RTC_DRV_S5M)      += rtc-s5m.o
>> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
>> new file mode 100644
>> index 000000000000..3a0818e972eb
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-s32g.c
>> @@ -0,0 +1,385 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright 2025 NXP
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/clk.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/rtc.h>
>> +
>> +#define RTCC_OFFSET    0x4ul
>> +#define RTCS_OFFSET    0x8ul
>> +#define APIVAL_OFFSET  0x10ul
>> +
>> +/* RTCC fields */
>> +#define RTCC_CNTEN                             BIT(31)
>> +#define RTCC_APIEN                             BIT(15)
>> +#define RTCC_APIIE                             BIT(14)
>> +#define RTCC_CLKSEL_MASK               GENMASK(13, 12)
>> +#define RTCC_DIV512EN                  BIT(11)
>> +#define RTCC_DIV32EN                   BIT(10)
>> +
>> +/* RTCS fields */
>> +#define RTCS_INV_API   BIT(17)
>> +#define RTCS_APIF              BIT(13)
>> +
>> +#define APIVAL_MAX_VAL         GENMASK(31, 0)
>> +#define RTC_SYNCH_TIMEOUT      (100 * USEC_PER_MSEC)
>> +
>> +/*
>> + * S32G2 and S32G3 SoCs have RTC clock source1 reserved and
>> + * should not be used.
>> + */
>> +#define RTC_CLK_SRC1_RESERVED          BIT(1)
>> +
>> +/*
>> + * S32G RTC module has a 512 value and a 32 value hardware frequency
>> + * divisors (DIV512 and DIV32) which could be used to achieve higher
>> + * counter ranges by lowering the RTC frequency.
>> + */
>> +enum {
>> +       DIV1 = 1,
>> +       DIV32 = 32,
>> +       DIV512 = 512,
>> +       DIV512_32 = 16384
>> +};
>> +
>> +static const char *const rtc_clk_src[] = {
>> +       "source0",
>> +       "source1",
>> +       "source2",
>> +       "source3"
>> +};
>> +
>> +struct rtc_priv {
>> +       struct rtc_device *rdev;
>> +       void __iomem *rtc_base;
>> +       struct clk *ipg;
>> +       struct clk *clk_src;
>> +       const struct rtc_soc_data *rtc_data;
>> +       u64 rtc_hz;
>> +       time64_t sleep_sec;
>> +       int irq;
>> +       u32 clk_src_idx;
>> +};
>> +
>> +struct rtc_soc_data {
>> +       u32 clk_div;
>> +       u32 reserved_clk_mask;
>> +};
>> +
>> +static const struct rtc_soc_data rtc_s32g2_data = {
>> +       .clk_div = DIV512_32,
>> +       .reserved_clk_mask = RTC_CLK_SRC1_RESERVED,
>> +};
>> +
>> +static irqreturn_t s32g_rtc_handler(int irq, void *dev)
>> +{
>> +       struct rtc_priv *priv = platform_get_drvdata(dev);
>> +       u32 status;
>> +
>> +       status = readl(priv->rtc_base + RTCS_OFFSET);
>> +
>> +       if (status & RTCS_APIF) {
>> +               writel(0x0, priv->rtc_base + APIVAL_OFFSET);
>> +               writel(status | RTCS_APIF, priv->rtc_base + RTCS_OFFSET);
>> +       }
>> +
>> +       rtc_update_irq(priv->rdev, 1, RTC_IRQF | RTC_AF);
>> +
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +/*
>> + * The function is not really getting time from the RTC since the S32G RTC
>> + * has several limitations. Thus, to setup alarm use system time.
>> + */
>> +static int s32g_rtc_read_time(struct device *dev,
>> +                             struct rtc_time *tm)
>> +{
>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>> +       time64_t sec;
>> +
>> +       if (check_add_overflow(ktime_get_real_seconds(),
>> +                              priv->sleep_sec, &sec))
>> +               return -ERANGE;
>> +
>> +       rtc_time64_to_tm(sec, tm);
>> +
>> +       return 0;
>> +}
>> +
>> +static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>> +{
>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>> +       u32 rtcc, rtcs;
>> +
>> +       rtcc = readl(priv->rtc_base + RTCC_OFFSET);
>> +       rtcs = readl(priv->rtc_base + RTCS_OFFSET);
>> +
>> +       alrm->enabled = rtcc & RTCC_APIIE;
>> +       if (alrm->enabled)
>> +               alrm->pending = !(rtcs & RTCS_APIF);
>> +
>> +       return 0;
>> +}
>> +
>> +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
>> +{
>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>> +       u32 rtcc;
>> +
>> +       /* RTC API functionality is used both for triggering interrupts
>> +        * and as a wakeup event. Hence it should always be enabled.
>> +        */
>> +       rtcc = readl(priv->rtc_base + RTCC_OFFSET);
>> +       rtcc |= RTCC_APIEN | RTCC_APIIE;
>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +
>> +       return 0;
>> +}
>> +
>> +static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>> +{
>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>> +       unsigned long long cycles;
>> +       long long t_offset;
>> +       time64_t alrm_time;
>> +       u32 rtcs;
>> +       int ret;
>> +
>> +       alrm_time = rtc_tm_to_time64(&alrm->time);
>> +       t_offset = alrm_time - ktime_get_real_seconds() - priv->sleep_sec;
>> +       if (t_offset < 0)
>> +               return -ERANGE;
>> +
>> +       cycles = t_offset * priv->rtc_hz;
>> +       if (cycles > APIVAL_MAX_VAL)
>> +               return -ERANGE;
>> +
>> +       /* APIVAL could have been reset from the IRQ handler.
>> +        * Hence, we wait in case there is a synchronization process.
>> +        */
>> +       ret = read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
>> +                               0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
>> +       if (ret)
>> +               return ret;
>> +
>> +       writel(cycles, priv->rtc_base + APIVAL_OFFSET);
>> +
>> +       return read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API),
>> +                               0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
>> +}
>> +
>> +/*
>> + * Disable the 32-bit free running counter.
>> + * This allows Clock Source and Divisors selection
>> + * to be performed without causing synchronization issues.
>> + */
>> +static void s32g_rtc_disable(struct rtc_priv *priv)
>> +{
>> +       u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
>> +
>> +       rtcc &= ~RTCC_CNTEN;
>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static void s32g_rtc_enable(struct rtc_priv *priv)
>> +{
>> +       u32 rtcc = readl(priv->rtc_base + RTCC_OFFSET);
>> +
>> +       rtcc |= RTCC_CNTEN;
>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static int rtc_clk_src_setup(struct rtc_priv *priv)
>> +{
>> +       u32 rtcc;
>> +
>> +       rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
>> +
>> +       switch (priv->rtc_data->clk_div) {
>> +       case DIV512_32:
>> +               rtcc |= RTCC_DIV512EN;
>> +               rtcc |= RTCC_DIV32EN;
>> +               break;
>> +       case DIV512:
>> +               rtcc |= RTCC_DIV512EN;
>> +               break;
>> +       case DIV32:
>> +               rtcc |= RTCC_DIV32EN;
>> +               break;
>> +       case DIV1:
>> +               break;
>> +       default:
>> +               return -EINVAL;
>> +       }
>> +
>> +       rtcc |= RTCC_APIEN | RTCC_APIIE;
>> +       /*
>> +        * Make sure the CNTEN is 0 before we configure
>> +        * the clock source and dividers.
>> +        */
>> +       s32g_rtc_disable(priv);
>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +       s32g_rtc_enable(priv);
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct rtc_class_ops rtc_ops = {
>> +       .read_time = s32g_rtc_read_time,
>> +       .read_alarm = s32g_rtc_read_alarm,
>> +       .set_alarm = s32g_rtc_set_alarm,
>> +       .alarm_irq_enable = s32g_rtc_alarm_irq_enable,
>> +};
>> +
>> +static int rtc_clk_dts_setup(struct rtc_priv *priv,
>> +                            struct device *dev)
>> +{
>> +       u32 i;
>> +
>> +       priv->ipg = devm_clk_get_enabled(dev, "ipg");
>> +       if (IS_ERR(priv->ipg))
>> +               return dev_err_probe(dev, PTR_ERR(priv->ipg),
>> +                               "Failed to get 'ipg' clock\n");
>> +
>> +       for (i = 0; i < ARRAY_SIZE(rtc_clk_src); i++) {
>> +               if (priv->rtc_data->reserved_clk_mask & BIT(i))
>> +                       return -EOPNOTSUPP;
>> +
>> +               priv->clk_src = devm_clk_get_enabled(dev, rtc_clk_src[i]);
>> +               if (!IS_ERR(priv->clk_src)) {
>> +                       priv->clk_src_idx = i;
>> +                       break;
>> +               }
>> +       }
>> +
>> +       if (IS_ERR(priv->clk_src))
>> +               return dev_err_probe(dev, PTR_ERR(priv->clk_src),
>> +                               "Failed to get rtc module clock source\n");
>> +
>> +       return 0;
>> +}
>> +
>> +static int s32g_rtc_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct rtc_priv *priv;
>> +       unsigned long rtc_hz;
>> +       int ret;
>> +
>> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +       if (!priv)
>> +               return -ENOMEM;
>> +
>> +       priv->rtc_data = of_device_get_match_data(dev);
>> +       if (!priv->rtc_data)
>> +               return -ENODEV;
>> +
>> +       priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
>> +       if (IS_ERR(priv->rtc_base))
>> +               return PTR_ERR(priv->rtc_base);
>> +
>> +       device_init_wakeup(dev, true);
>> +
>> +       ret = rtc_clk_dts_setup(priv, dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       priv->rdev = devm_rtc_allocate_device(dev);
>> +       if (IS_ERR(priv->rdev))
>> +               return PTR_ERR(priv->rdev);
>> +
>> +       ret = rtc_clk_src_setup(priv);
>> +       if (ret)
>> +               return ret;
>> +
>> +       priv->irq = platform_get_irq(pdev, 0);
>> +       if (priv->irq < 0) {
>> +               ret = priv->irq;
>> +               goto disable_rtc;
>> +       }
>> +
>> +       rtc_hz = clk_get_rate(priv->clk_src);
>> +       if (!rtc_hz) {
>> +               dev_err(dev, "Failed to get RTC frequency\n");
>> +               ret = -EINVAL;
>> +               goto disable_rtc;
>> +       }
>> +
>> +       priv->rtc_hz = DIV_ROUND_UP(rtc_hz, priv->rtc_data->clk_div);
>> +
>> +       platform_set_drvdata(pdev, priv);
>> +       priv->rdev->ops = &rtc_ops;
>> +
>> +       ret = devm_request_irq(dev, priv->irq,
>> +                              s32g_rtc_handler, 0, dev_name(dev), pdev);
>> +       if (ret) {
>> +               dev_err(dev, "Request interrupt %d failed, error: %d\n",
>> +                       priv->irq, ret);
>> +               goto disable_rtc;
>> +       }
>> +
>> +       ret = devm_rtc_register_device(priv->rdev);
>> +       if (ret)
>> +               goto disable_rtc;
>> +
>> +       return 0;
>> +
>> +disable_rtc:
>> +       s32g_rtc_disable(priv);
>> +       return ret;
>> +}
>> +
>> +static int s32g_rtc_suspend(struct device *dev)
>> +{
>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>> +       u32 apival = readl(priv->rtc_base + APIVAL_OFFSET);
>> +
>> +       if (check_add_overflow(priv->sleep_sec, div64_u64(apival, priv->rtc_hz),
>> +                              &priv->sleep_sec)) {
>> +               dev_warn(dev, "Overflow on sleep cycles occurred. Resetting to 0.\n");
>> +               priv->sleep_sec = 0;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int s32g_rtc_resume(struct device *dev)
>> +{
>> +       struct rtc_priv *priv = dev_get_drvdata(dev);
>> +
>> +       /* The transition from resume to run is a reset event.
>> +        * This leads to the RTC registers being reset after resume from
>> +        * suspend. It is uncommon, but this behaviour has been observed
>> +        * on S32G RTC after issuing a Suspend to RAM operation.
>> +        * Thus, reconfigure RTC registers on the resume path.
>> +        */
>> +       return rtc_clk_src_setup(priv);
>> +}
>> +
>> +static const struct of_device_id rtc_dt_ids[] = {
>> +       { .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data },
>> +       { /* sentinel */ },
>> +};
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
>> +                        s32g_rtc_suspend, s32g_rtc_resume);
>> +
>> +static struct platform_driver s32g_rtc_driver = {
>> +       .driver = {
>> +               .name = "s32g-rtc",
>> +               .pm = pm_sleep_ptr(&s32g_rtc_pm_ops),
>> +               .of_match_table = rtc_dt_ids,
>> +       },
>> +       .probe = s32g_rtc_probe,
>> +};
>> +module_platform_driver(s32g_rtc_driver);
>> +
>> +MODULE_AUTHOR("NXP");
>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.45.2
>>
> 


