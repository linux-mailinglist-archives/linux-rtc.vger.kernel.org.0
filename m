Return-Path: <linux-rtc+bounces-1829-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0360696918C
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 04:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F161C22995
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 02:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3655319F131;
	Tue,  3 Sep 2024 02:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Ten2COfv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020094.outbound.protection.outlook.com [52.101.128.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3281A3F9EC;
	Tue,  3 Sep 2024 02:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725331719; cv=fail; b=ng8AIDqsG1GcOAJAVaTPn8e8zrIe47NkUKbHdey4E1GPDXpRXyQYwDSjORBn4kHDiPVtCxNHowRQNLStVCILWW08Bt01lXGkhB1Z803ZFUi0WWOT+XF9cvwZnCDHmgqE8keKDVSmzdqxBBc/IGCvhXOFSwdilDEVNuQDLUx/ZiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725331719; c=relaxed/simple;
	bh=bZXDqSg+EYi8zgVT5olPyRCvieq0FLF9pwgTQVMeJ8M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dPuqL8X3K87XhEl7tgKSLmN4BV9pQdU29GgdeiL3fKfOQsgNd3MITm1sJiuNtO3r4mzIvQfKNJ/3mz2nSS85flXcUt74KucNPsNGGXcTE+W3CZv+peBNKb67olZXnMMznqpf5yTbDYvoIU7WZ5B1GENruIkSOm+CSdf55uiv0mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Ten2COfv; arc=fail smtp.client-ip=52.101.128.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyJAmt5eFmYhdlPWvJv5hg4V+9U6KRNwk7M012aNSGOOI24JUugMzIxVPL6mt/1s0pHngexXwJ6FkBm0+pB9tWumcSjoVY6dktGDgvEHJ+gpepiL4m/uyQqdvWal8ZRbMNNywc+nDUOzrUY+hAaVjyiiU1vPUXMeCInvgOQ3AM3fMPK6BgQpxqBhE7+aopVcTd4v3XjCscQue5PaHp9KNQoFGdGDjQb37Euj5pfCDH+j+8d/Rk7IYT+/+w2eYOoorYYWxRpn+fUPv/5TpjJb4zlE8aGicGzyOme3n1NOdGVavuGTlUddI5zjCF646aFGLJW99q+HUWgo9icxjGnwRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=me7UOgNkqH9juzf2vVEFF556diZDmStj5xAQP3b6T78=;
 b=CxbGRdTl9cNbtJPeMY4U4YTsIUQq19Rl32TBgL8qCfxobvzk1feS9LtLjBBnxpjPWoABcbU9Gq4tKAIefjJDvgxoyAAzZydBYXJJ9b73N3zx9wWq+nzAfWH5DTe8KnTVYQXLx/ihWONf+r0BstYLe6ghpAwI8IILvOLMCs5sajzMQ6WfNGZBaYxJzjD351RwElmYr4+OnHe6d9gVQEbdB6R792jWhyWtrPhmR095Tf00NlaNFEPEk3K3BAZ5/qhrCBa/sFcom7tVX17/wd+esC2qy8dxjaZ0sTvVN0NYgepElfL5sOBNsv7tVwLVZBC8t3KIMvXDW1zYEXFCVxhb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=me7UOgNkqH9juzf2vVEFF556diZDmStj5xAQP3b6T78=;
 b=Ten2COfvao4wdI5XH34aK4QWt5dc4eWc8FvXe5LHHecyHY4Nk26oSKlWWS8N6eUDx9bZIZNMVqmd5hq5ZFaX08CtkdHP5kVdp38SCWAoqPTZXjnloTaRXrG2Y04omqhvYKiwyEllpsuAFpZjuAEB200Gi1v8Vh/Rxlf6QMny9Py2jDZ8EFyZqD0pP0y7Z4WdAcf5rBmi1jH1WqUbLLKbc2aV198QXhJkMy4lLFnc+EJuvslLqdRqLkrfwPigVteT+D2q/ufnYdXdGYYtQiQHtA+xH98zifM4FNqpckSoKCh24TgSv8HLx3tQ3FZodA9VygEoMKVDdGqUuv5YsMZ4cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by SG2PR03MB6588.apcprd03.prod.outlook.com (2603:1096:4:1da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 02:48:32 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 02:48:31 +0000
Message-ID: <d6187076-5fab-4804-a008-cfb5d85f8cd1@amlogic.com>
Date: Tue, 3 Sep 2024 10:48:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
 <20240823-rtc-v1-2-6f70381da283@amlogic.com>
 <2024082609451907fd19e2@mail.local>
 <20ffd260-3c24-460f-bdbc-965573e110e3@amlogic.com>
 <2024090220195462df6c95@mail.local>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <2024090220195462df6c95@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0117.apcprd03.prod.outlook.com
 (2603:1096:4:91::21) To PUZPR03MB6888.apcprd03.prod.outlook.com
 (2603:1096:301:100::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|SG2PR03MB6588:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c5b2b4-32d0-4580-a46c-08dccbc2e590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c05qamZZSW01c1hPc1Z5a1Ivc0dDeFlPazVDM29ic3p6NlNqRDdtQ1grbEEw?=
 =?utf-8?B?RmNsVm9uWkYyS0hZc0pvRE5xdzRLSVJBTVRJczlQQ1M1enF6R1l2aVhxNTQw?=
 =?utf-8?B?ZWlFV0xiQkZEbnUwbkJEaElDTlJJQ1hrRnlVWFU0TXhCcmVkdHRQQkRQNURE?=
 =?utf-8?B?SjBvVTFsdWlqU3FrMHp0ZUl6dTBNTlZ0aXluYy9XZEREK0lnaXRjTWxaTkxl?=
 =?utf-8?B?elVaZXZlV29uVnd3OWpOcW4zNXRvT3YwRlJwdHY5Z1Z2REJPaHJjSmdLSzhP?=
 =?utf-8?B?NzhzRWwrTW9VcldKZWZkNkJLSnVHa0xPRnUrdkhxSnZHT1d1cHVhcTlnUzcy?=
 =?utf-8?B?QWMwWFJVZnU4dW55SEdUZFpLd050ZWdURm11d3ZhcjA3ZlRuUVdwd3lxSGpl?=
 =?utf-8?B?cHVNYStjYjFYbEtJbHNDVG4xYkk2TDJPTWhXc0lxRTFvQmg5eXhXaGlwVVI2?=
 =?utf-8?B?VE53VWp3VWZBSXp6eGl2ZmcyQlBUNFRPV3JjK3Z0RkRSN2crbVEvTjJoenBK?=
 =?utf-8?B?M1JpSnQ5WEJYREk3dFF1L3B4Mk1BNVhkSXJnZ2lwcUpFNDd4TVBlOHI4Z0N2?=
 =?utf-8?B?QjdiN1JrVVJCUEF3bFNUaHN1Nko3MEMyV0dRaUFUZU0zbHBCZDYyTTZpOVhV?=
 =?utf-8?B?a0liUm9BNmZsMlgzUHBZRUNUUkVNUTNDZWswQnpvUkxjcnhRWVhiR1JvYkZO?=
 =?utf-8?B?NXRQWW84WmxEdTNLNFcvOXMwdUtsMUJQQXlKMTlVVGxRNFJYZUlyRmhra285?=
 =?utf-8?B?TGwycVZZbTdXeEVPRHJFK2lkb1NTNW5xaG8xZTlzYXhJTmRLWTlkNElrRHRa?=
 =?utf-8?B?d3gxZ3lpN2NaWWdOOHhHTVNjeUNiakxILzlSSzFzdGl2dGEweVlSbmtRVVM1?=
 =?utf-8?B?NEtsU3lKa1lMZ2dwNmNHc1lsbUg4NmRUaTZaNjJrWEcrTTFLb0NZNXlkUXRI?=
 =?utf-8?B?UmlSWC9ncXJxTGREL3RzQmpqSGZFRThVbWhCb1dkQVk4TnVBbG5ZdllmZlp6?=
 =?utf-8?B?MkZueGh5T1dQbEZMSnU4akp1cDBuQVgra292Q2djVGFTZGQzT1MzcmJxd2NZ?=
 =?utf-8?B?QWoxUmQ1QWNMUVN1dnFGcjFVYXA3K1Z4bUs0REhxNU44OS9TeWprRXBoNmIv?=
 =?utf-8?B?KzFnSTFEMHgveWQ1Ujh4Q2l1a2tnQ0pJbTRoOEtLZ0tKWDVZSGNMODFjdnM0?=
 =?utf-8?B?Syt3Q3gyYXhWc1NiTDJSS01Wam11dzVjaERrN3ljZkN0RkVERXdQSHBoRkty?=
 =?utf-8?B?cWVKUEZqaEdSTGpxdzkxN0laNUErSklIUERXcC9OWjl3WjF3UTJjcnMxRk10?=
 =?utf-8?B?eGIwd2tabkxhMDFsUm5tM2tITnE4UHgwcm1uY2tpTE5qK3hyM2NsTjYwTnhi?=
 =?utf-8?B?anlBSFBJZjN1b2Vid1ZsTmlYRENJOWdPK0xxSlk4ZzNrclZoR3VHdUIwbHI0?=
 =?utf-8?B?WnBieTJkZE9rSlJYalZEU1pRQndtdnoxTlgyV2t0VzNTTk1HVGVWcTk2cDFM?=
 =?utf-8?B?czlBYy9hOEQ2UktTZFZEUEtQdHcvTGQ3UTNNaVlOemRPZWhycHh2U0J3Y2lU?=
 =?utf-8?B?RmswelFPQmhTYkRSRWFqZVpKMjh5dzBpdFNwcm5rQndMQ2JNS0FwWHJKMzN0?=
 =?utf-8?B?dDJ4NHQ3eXhJajFmZ1diUEQwZG85T2MwNkM2R0p2NVljbUFvdXJzcm9VM1NL?=
 =?utf-8?B?TXREMlhLRnQyQkY4T1YyMlBmeWQweHVTUGtDWkJGdWRwWkJBRHk2UWVLR1c0?=
 =?utf-8?Q?EBxtSJPbInmn501kx4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlBxbUo3QlFzcWtjcGpiRDh1djNCQWRxT0JtT2E0Q1UvaHo5Q3ZFL2ozL0Ri?=
 =?utf-8?B?dnp5YTkrSGtISndPNmNqSkoxR0JqeGRFTzllK2I3RkJDM2g0dTUxMG44cW1T?=
 =?utf-8?B?TzYxT0NaMWlvekwzMEUzQnczckF6dnc1VUJJc0tBeGhuYzlLckRkYVRnVGo3?=
 =?utf-8?B?MlpPS29pRXdHam8xaU13Ui96U0pwcms4SkpvdTNlaStPeHFsNS9RK3hjd0RI?=
 =?utf-8?B?K3hwait5WUR3eWhVT0VSTzQ1blpONXBCUnVaaUpQajJwdnIzOXNrdFJQQXVI?=
 =?utf-8?B?S0tpcGlsditTNHhNRHYzUDZER3o0WGxKNUdZTnhtVXB0RXJPV3BpNE5Ma3JZ?=
 =?utf-8?B?Mk5WN004R1dIRnRMZnV0aVdGNzI4aWw3cFYvajV0Q0gvb3dGOG9WQi9RTTVG?=
 =?utf-8?B?RTlyTXZOdGhWSkcyU0hmWVZxdHVzeS8relNKZGhvUUsxSEdpTUtyME5wUmFM?=
 =?utf-8?B?WDg0eERTTzJTNDR6QnN4eWpnQUxHSlBrZDNmNzE3aUtOYmpYckxTbFpod240?=
 =?utf-8?B?Y1Irb0tTVlVLVlNMNk1IRjl6M3RNcFY5WDFZcG1odlJJd0c2RGE3MS9aVVAy?=
 =?utf-8?B?YVIrK21KZ3NWN3RQeXVUNUZsdjJGeS9CcGx1dWFpc0NhN0ZtcnJTc1A4NzRI?=
 =?utf-8?B?UGZqZ05zUVJHcytJVFNQTEl5Q3NpRHluMDE5WWFqSDlCSFNPTWFtN0owK0t4?=
 =?utf-8?B?akdCYnFwL2xobFR1c2xScHp1a1d2cXhhaStEVU5QeHZYVzZhZG1uVmFPeDhw?=
 =?utf-8?B?aFMvaWtrMEc1V09rVnIrRERSME8wbFJoZWJuQXRrc2NubE9IakpZemZTOEJJ?=
 =?utf-8?B?WTdzNDc2Q2hvQlJ6bjMrbTBxaE96Rm13eGhlZ3RuVWxFNUwvNWlpeDQ1STBP?=
 =?utf-8?B?K1hXWE01VFUzaGp0MnlWYW5FRDdlVTd6SERkSmdvVDNnRHl4aFA1VUhOSSt0?=
 =?utf-8?B?d0F5VFZ5S0RMSk9oS2ZNN3hIakZtSzAxOHZLejFxT3lZdUpwUG55YkRFb1lZ?=
 =?utf-8?B?Zld5bGVaOUN0R1hrcHdhTUZjVmJHS1dQTi8wYVdXS0hhTWgyWVp2R0VvbGF1?=
 =?utf-8?B?bGVCbjdUT1hHc01QWmN1eGNsdVErUFVWa3BVNWk4M2NJY1JkWmcwOTVrUGtq?=
 =?utf-8?B?Y2lZQWgzKzJjY2NsM1ZseEtlSktHL1o0NzgyN0xFM0xVeW1tNDIrWlg1SGk3?=
 =?utf-8?B?SllWVkRIV0lmOGdJWTk5TmFiell6U3BkYzc3YThYWVl6NGJ1SFcxWFNGcW9x?=
 =?utf-8?B?YXZib0xwTkdvM1VjWFRhQzZIaW9rYlA3Q2xhZkx1bkNZU2toTnIrRHh4eFBD?=
 =?utf-8?B?ZVhBaXJ1aG5GS3lPZGUxTkpFaTlpM012cjl0dk55djZaM1lqbVk4bzcvT0Fr?=
 =?utf-8?B?STBVWEU3b01rdjY4bFliRmJiNkhWUmJFaW9Ud250Z0NwWnkxUXZSOGp5MDJx?=
 =?utf-8?B?L3hOZm1ZVHJEMThWckJDNEJDV3FIUk13S2c0M0ppVzd3ZHM1UWNtSzE0Ui85?=
 =?utf-8?B?cUpOSW9IUWtsYXIxY0VHZml2SjU0TTUxZVpOOUxhd0hmQ3ErOUFobGI3UFEx?=
 =?utf-8?B?VUNBZEhTelEvMVAwbklXVnRHTm80Y3JwWDF3TDFWanNCeFpoMVVqSk5sVFRD?=
 =?utf-8?B?aWJXL29UZ25wNUpFZkVrSlc2eGlPRGU1UE53SUs3aVhlVEliejl1dm95bnMv?=
 =?utf-8?B?KzgzMlRuTVBOUnFVZnhnTU8xVys3amZRajcwcWFUVFlrNy9CdEVQL1pPY1pp?=
 =?utf-8?B?MlQwMkFMb21pOWw5ejl1bGY1T05EMDR2ZUNxMmltMVpsSUVLaERrNWtiUnc2?=
 =?utf-8?B?ZzlnbXkwYmhhYWFmREM5VFdPZ1laTkJ3dUpzeGQzVjR4RlpkK3BZcCtoeDA1?=
 =?utf-8?B?TE1mN2lVSkJTR3dhVDVsSTA5ODBOU3drU2dINjlLNXlXUE5VVnl5MnllS2Z6?=
 =?utf-8?B?dy9KWGExcHBwRmNuZDV5QW5saFhvVElRQi9HM0xIb1VqZktRWmtHd0REVVQr?=
 =?utf-8?B?UzBhem9BRGw3bTQ4cnppTEwza2Q5OEpHZGd2STlHYVI2cjlaYml5cFFoempR?=
 =?utf-8?B?TjZGSExWdVN3R1VqTTNFL1BUNkFVSjdtaDNiNXJsWHZaYloweXpEVElrQWdX?=
 =?utf-8?B?d29lblNwZkkzdnQzQ000UENEOFhYWXFsUEFVbHM1elF2UElLTTREU29GOHNZ?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c5b2b4-32d0-4580-a46c-08dccbc2e590
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 02:48:31.6964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59p65GY3mRoRKoOrYMSzYJU8uW7RQ3WjT4QEw8dMfe//84IoN9jasYY79eWaZOu5BE0lCoVNi0LypQeSzFB5zn8zPuSSEV5CF1NP4mH1llI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6588

Hi Alexandre,
     Thanks for your reply.

On 2024/9/3 04:19, Alexandre Belloni wrote:
> [ EXTERNAL EMAIL ]
> 
> On 02/09/2024 16:14:45+0800, Xianwei Zhao wrote:
>> Hi Alexandre,
>>      Thanks for your reply.
>>
>> On 2024/8/26 17:45, Alexandre Belloni wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On 23/08/2024 17:19:45+0800, Xianwei Zhao via B4 Relay wrote:
>>>> From: Yiting Deng <yiting.deng@amlogic.com>
>>>>
>>>> Support for the on-chip RTC found in some of Amlogic's SoCs such as the
>>>> A113L2 and A113X2.
>>>>
>>>> Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>> ---
>>>>    drivers/rtc/Kconfig       |  12 +
>>>>    drivers/rtc/Makefile      |   1 +
>>>>    drivers/rtc/rtc-amlogic.c | 589 ++++++++++++++++++++++++++++++++++++++++++++++
>>>
>>> As pointed out, this is the third amlogic driver so the name of the file
>>> must be more specific.
>>>
>>
>> This RTC hardware includes a timing function and an alarm function.
>> But the existing has only timing function, alarm function is using the
>> system clock to implement a virtual alarm. And the relevant register access
>> method is also different.
>>
>> The "meson" string is meaningless, it just keeps going, and now the new
>> hardware uses the normal naming.
> 
> The proper naming is then definitively not just amlogic, because in 5
> year, you are going to say the exact same thing about this driver
> "register access is different, this is for old SoCs, etc"
> 
> amlogc-a4 would be more appropriate.
>

Will modify driver file name to rtc-amlogic-a4.c


>>>> +             /* Enable RTC */
>>>> +             regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, RTC_ENABLE);
>>>
>>>                   This must not be done at probe time, else you loose the
>>>                   important information taht the time has never been set. Instead,
>>>                   it should only be enabled on the first .set_time invocation do
>>>                   you could now in .read_time that the time is currently invalid.
>>>
>> There are some doubts about this place.
>>
>> You mean that after the system is up, unless the time is set, it will fail
>> to read the time at any time, and the alarm clock will also fail.
>> In this case, the system must set a time.
> 
> Exactly, reading the time must not succeed if the time is known to be
> bad.
> 

Got it.

>>
>> When read time invlalid, system is will set time.
>> This part of the logic I see the kernel part has not been implemented, so
>> only the user application has been implemented. Whether this is reasonable,
>> if not set time, you will never use RTC module.
> 
> This is not going to be implemented in the kernel. The kernel can't know
> what is the proper time to set unless userspace tells it.
> 

OK will place enable action in the set_time process.

> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

