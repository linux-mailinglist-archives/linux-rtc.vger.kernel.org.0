Return-Path: <linux-rtc+bounces-5821-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEENFHPFcGkNZwAAu9opvQ
	(envelope-from <linux-rtc+bounces-5821-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 13:24:19 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C070556B49
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 13:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 904BC9A916C
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 12:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472A727A123;
	Wed, 21 Jan 2026 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G8sc2S/J"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F84F2BD5A2;
	Wed, 21 Jan 2026 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997771; cv=fail; b=UM8JSCIPeTqSnXGxHE7dSgywA4TtoNxf2nd4YcSsuYMNBWu4IMpRUnrjBL8FuHe/3oZtLsVib3piWRuWHDNErtvCtLrmAVG7gJEwa7hPWvmDU8dLq+3/6jnhpO4G1aUysE5k7K1aQGGx3mzgFJIaCrAu6Kz3h1l1kRi3hH73nPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997771; c=relaxed/simple;
	bh=Rk0iRHxR+w76Cq6/O7KJI/lWYLu3BYRpV+4m1abQS+w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZaJgUY8Tj8r3HlNR+TmDohQcDcDEBBXpwR0nGCQcagy8FggzcPz80Mz2Rra0cSkb9FlnpT7264GfoPposJ+18KuYNq6ckwwOSRZUc8RGA9728O2dBJQW1wQKFS4SVdxDozeGFpKM0EMmPKXO79SLhyXK870+flKKv3T+C8unUbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G8sc2S/J; arc=fail smtp.client-ip=52.101.61.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVejWyc9FW+ia/QA7Fx13B+vb3R971aQ8gTJXxpTtY7Ng82JfNlSSsLyZUmZp77JERYbIohw62Psh+nSocCWSgwhGXA60H0aKOKuhvcS58Smg3pellm7QnwUfjBzjEv4iBOtzR3LmQVBgRVHpWK3Tm6a0j4tl91DMK5ZNOSfnwuRX680OsI3Av6x7qTHciYhWjghqU5uBlnC2OLQu7fpJih8zOqk8MlCQW7N12MV1m8DYQyRnjF9py2sBlnGvH7tw9q591ThgLYRbo//cQmUaZvsxJg10Yr9+zwSp9T9Ca+50XLoKc9mT9JnrJ6tjKyHY4Hm5s5EeI0wYcBoCuKFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFIB7Dmxx/K4rto/69qu5aHFZEbJYOA4dncD1I/dlSg=;
 b=G75ObhtMDlmYs5ZD/idtTVIIRzkE1LX/HQyHGVIZadZZBUuaY7bowoQiwjar9j9fZ4Cpr7nDlF6Gc1iVVaXMLwwQZ4b90XROU8GobuDHGDk0VBOtXhXVwhc4IYROjFuKsiUUYbiYaalzTqIQWjPpRk6bFgB9OrGrivMqODDp83YQC5aauePDDzf/O1wpoM26vhJ82rfsHXNU/4I3qaFTvIT8nLm/9Wsk22xsWdJmvwHoHIFxVvh1VSqQvP9ljXwdkDsQfAFYgNpnT2qgVLFYYT2xp4asj5Pzxlw2FbTVoR/EkHUHP5GPFoDGjKcqTfdYblg3nLZAO8bJO0BLO7dZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFIB7Dmxx/K4rto/69qu5aHFZEbJYOA4dncD1I/dlSg=;
 b=G8sc2S/JWv0ZHeEFolqIEuHjfgyO8R/WYN2NkwVVigWgi7lXN9jiJi4jZk9efYr1W+o5EZsm/tVh6o5y2Z+06fpxxnV+VaR5Ym9PnruSjaqdqI6u6aSOnPnFhdYIssLt2InQarslaOF+Alxd+nmTsWQWz+VcSxn2M/SuBTsjlII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CYYPR12MB8853.namprd12.prod.outlook.com (2603:10b6:930:cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 12:16:07 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 12:16:07 +0000
Message-ID: <a373e247-3936-4c16-993b-ca8fb732fb18@amd.com>
Date: Wed, 21 Jan 2026 13:16:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] rtc: zynqmp: declare dependency on arch
To: Tomas Melin <tomas.melin@vaisala.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
 <20260119-zynqmp-rtc-updates-v3-1-acd902fdeab1@vaisala.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <20260119-zynqmp-rtc-updates-v3-1-acd902fdeab1@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::16) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CYYPR12MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c9b8d0-7030-46f4-9c1b-08de58e6daeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjA0YTd5N0pGbWhFajFtaVMzREx0QjJpQXB5ZDVhZzMzWU45bVVYeU5QY05I?=
 =?utf-8?B?cXk5VFJqSklISW03NmU3eHByYjN6dzJUTkV6SEtZQWhzek9MRG5zSVFLK09m?=
 =?utf-8?B?LzVvWEkyM2lMNmhPTHlITmJaV2ZzSDFZVVQvcXF5dWkwdTFLaWl1ZWtXTENr?=
 =?utf-8?B?Z2QwMjhwT2RsRm9LWUd4VE5sRTg2dXJkNC8wTXc1bG1Sdit2ekdrNVFVWTNE?=
 =?utf-8?B?Tmo0MHc5TUltc0hZVUdMVDZyUndGUVJxNFNPWlVoN1NlRkFOL0tJZU9jVnhm?=
 =?utf-8?B?TlFFdGVEQWlWNGdEODVyQ0JZT1lnRUgvdE4wQkxzWWxqeG5RTW5hSk0rUW5X?=
 =?utf-8?B?NlJoWEpyTUZEb1hZRUJpWi83NnQ2aHdqZ1RtMGZVZWVPWFRwMFdLR2hKeGVD?=
 =?utf-8?B?R1QvT0w2TlJnTW4yOEdXZ2hZTUdHM0Z6R0xVaTZMNXdYZWZjeWVzUlF6dzcw?=
 =?utf-8?B?MmM1dWZXS2J6WjJiaXYrTDZtY3ZJZ1gzZzFBU2lpdkJEeU00UXJnRGJVektZ?=
 =?utf-8?B?WDZCNFREVmFVWE5DTldSL3dsNDFKMEJCSnkwNzJ6NzQrWU94WGNzcnMxdnYz?=
 =?utf-8?B?anc0bXM2WHlENHRyZ3p6aXFWN3ZZS29Idm9KU1FCd0h0MDhiRFBzUSsxWVpj?=
 =?utf-8?B?ZzdTaEo1NnhMcCtDVzhtN0I3SjFsbk5vL0QraW45Zko4R1hZMUUyM2lHQzg2?=
 =?utf-8?B?US9hVVJGUENUMC9aV2s5MUF5Vkw1UzVwUmo3U3Erc09vcFo5T2QxVzdnVGZX?=
 =?utf-8?B?NE1MeVVIYzIrbVFVdDdTb21semJwTy91U1B0a1JGVGxCWHZLakpuUWp4M0V4?=
 =?utf-8?B?a2Z3OGRhK1dLajdzVHkyY0xnalZjeCtNYmhQWk5LUGR4V1E2TVdibjdqSUlO?=
 =?utf-8?B?L2pzMWp3bEozMDI4d1RzK3ZsK1d3Y2RQTTN5SDZheU9PUm4yaGNjRWNVYytq?=
 =?utf-8?B?d2YzK0VEd1krYW5BZlp0M2s3V0ZrSWliMkF1TjB1a0dQVlFFaDZKV0tCOXR3?=
 =?utf-8?B?NnpvSmp4MDExRXk0dmgvdG1TYjQ4YktXbTJsREllZ1BaZFBzZ3U0KzlFR2FC?=
 =?utf-8?B?SEFFeTR2QWszTXByWXMrbzF1ak44OWw0TklLQ243WFdEaGFhV2xESUs4ZUw5?=
 =?utf-8?B?NXFkaUlRZWVuL0FzeWJ3NkhjemtYMlhSRXlKK0xjd1M2cFFWd3IwQlZaZ0xt?=
 =?utf-8?B?MzE3OWpJMzdxNkdKQnNhbVpTSWZBRUNQSTRaQklPb3ZlWVN3dndTcDZTOVll?=
 =?utf-8?B?V2hJU29uYkZURkhiQWdZdG8wWFBWTWp3aHVCUjQzT0UzL0daNEVLQUgwR1Rl?=
 =?utf-8?B?WmhPcEFuVDl0eVRMS2VvNit1dnJ2VFBCTjdzbzV2bVAyeUdvZTNOT3h6TlZ4?=
 =?utf-8?B?N2tITWZINDlIaHE1ZUZiUTRveHFEaExjSm4wV0Q3dFJOUVVhdzdla290Mmdz?=
 =?utf-8?B?eEZiWVJSYTI3Ry9scHo4RVpIREJzR1VqM2Q3ZG00SEJUQmVNTVhPSFF4Tnd6?=
 =?utf-8?B?ekRVcWYrSTk0Y2dMejg4WFZYdTlRaUlkcFhYMmdhbXdTZFBqc2ticS9wOEZD?=
 =?utf-8?B?emI0M01USXFWelJGN2lTbGJKRHpyNmU2aWJHOVcwc2VYOWRNUzY1bXVBcE5E?=
 =?utf-8?B?VGVEaEVOR0ZjNE1HS2NnUW1RZTcrT2ZLa1BpWDJBWXlFaU1XNHVDbUdMZDdJ?=
 =?utf-8?B?eFNDeVZxYjl3d2o2cElWSkxyRWRHWXY2UUJkaDJwaXJDb3g1YzJ2OVlsTHNu?=
 =?utf-8?B?Q2YvQ2IwTnREYTE2cGtRd0t3dkhzNW9naWdJZHhDQjhNeVNGVFMxWFFRdUxu?=
 =?utf-8?B?akpqbmhGUFJHSS83M2NrN1daUXJqNkVCY0hsSHMxV0lhdnZwSGgrVGtwWmpi?=
 =?utf-8?B?YUhBS0JPUkxlS0l5cC90TmdxKzZXNUJvUXA0RmtsQm42VXBpS1Z2QWltYmdq?=
 =?utf-8?B?bHdobnRqbmJIdm1la1Z0UlRjTHd6alRqVjd5VlNyZ3pjdUZ2TUlNalp1eVp5?=
 =?utf-8?B?a0k3ZGtpOUVHOGV4UnVkcEhXT3hvdjN3RjltNTFSQnlhVzhpTFFIcXBOYXUx?=
 =?utf-8?B?MS9RYlVmeVNvcTRmZGlVRytLZy91bEt1TFVLenpXS3JNcHpCckJHYXczejh1?=
 =?utf-8?Q?QbE0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmZ5bTdFdURiTVdqV3BsNk5DTU5zVHhaL0F5UXFoZFEvS0EwRlpzc1J3Ti9w?=
 =?utf-8?B?VjJia3lBTU4zdDdKNFNhSFI5ekQvYU1aSk9ib0VNR3l3MEw0T3Y3SFMzMXQz?=
 =?utf-8?B?aGdxL0ZreG1EYzR6dXhYWmF5ZUZJUDltL1RKL3R3WDBWVUlTaldSWS9mekgr?=
 =?utf-8?B?VGlWN2F2TmIyOVVNQ1d6MFp1Kys5V211dFFDZ3lQaWl0aW8yS3FFSWx3bWdn?=
 =?utf-8?B?WHJqU0RmK2FJQURkQ3VvMndXTkhKUWpvbFNCK21iY1FqaC9tMllBVWZzVEk3?=
 =?utf-8?B?cVRvMWMwMHRZYnJpdy84amFuakpzcVkrdW9WYWhFSkUxTU40T25pbXNsUkl0?=
 =?utf-8?B?TEpoaUEzenNkVSsyZnhYdDFtVHR4SVVVcFZNOTFsaXpPV1NFeEpndEZrdEdy?=
 =?utf-8?B?NmxHbHZQZkc2LzF6Rk9INU52SVR4bnpKL2ZYSVJtdmhFNGlWMGpObDBtVGVO?=
 =?utf-8?B?WDV6UWF4cFZ3R0RtanJoV1NCR2xRaDc1cHJ2WUZnQ2tNOUtQOUowbHduK0Rj?=
 =?utf-8?B?cWdRTE9oRFhpNEFCU01MdThKYXZ1clY4VUx6d1VLZi9Fb2tuaStKa3NGaGNM?=
 =?utf-8?B?RnBNZWJrMUVqU3BKUUlrNG1SVWVVS3lnbUhYYkVJOVdrQjlKaktlclh4YmNz?=
 =?utf-8?B?VUpvemRmajJnT0xZcGlVdFFGTkRaUEVKa2lZRjIyUlJ3K3BqSzRwNTRtMVcr?=
 =?utf-8?B?Z29xRzdZc0NydWgrK3dWUmxhVEI4VXF5NXBQUkxJSDNESmd0OGR3MmdKendU?=
 =?utf-8?B?bG9kaVBlcDg2NkN0MEx3NGNMMTVrQW5hcDJvbHFibEpuclRUdWtkWTF0QkZH?=
 =?utf-8?B?cHgzU0pNM3NCNFordDhOc1Rvbi9EdWU5MkoxS2FRakN6NFk3bVdEb3d3cFV4?=
 =?utf-8?B?Vi9FTGhyUjNiQTFWekJNN0c2T1I0Z1NFTCtralJVTkpTRnRZaGZRb1ZZeTlP?=
 =?utf-8?B?V25IMVQxc0lRNTgwTXNFSm8zcEYyc05XcUNyOERzVXFnTDVwVzRwckRXbi9E?=
 =?utf-8?B?UVVvT3RlRjdFQzlvU0VWNmhiWEpURStBSWhUUm9yYmFmRHpVbVdMSTArZnRS?=
 =?utf-8?B?c1lncDdFSFZBYnlLTGNnbUZmU0thQ2xXRlBXVnZKSlA3eGcvMkNYbjlkeG52?=
 =?utf-8?B?NklMSjI1bG5sMG43M2hyQWU4eDF2STlDUnNwOWNBdktaN2l4dFZVejY0ZzRl?=
 =?utf-8?B?WkF5bEF0bURjMi9DandsL250L1BsOGtEQUZVUm12U3J5KzNUcGxJK2d6dkF0?=
 =?utf-8?B?VkhxSGxoZEVvdTBqYjh2MVdieHpGc2J6SXB0a3ZwMmNTZTRZdjhodFI0MGM3?=
 =?utf-8?B?WU5VcDc3MDVJVGE1OUJGYjJqY3E2RWh0Q3phcENPNEV2ZjhJMGY3dEgvSXhE?=
 =?utf-8?B?NTRJUFR3TVI2NGxXM1lwZExhOUYydi9TMHpONzkwU2RCc3lUSjhJYy8va1JW?=
 =?utf-8?B?Rnd4QnJod0ZjTVpKS21QQW51am5FV0dxT3pKTTByODA5QVN3aWUxNDVKY2Zu?=
 =?utf-8?B?UGNjdld6eE9STUg0aXN4M1J3bEdTbVJFQVpWUHNySW5BUTlYSko2dWNGT2RC?=
 =?utf-8?B?ZzhIaHovbTdVSFI1aEd6UzlibCtyR3ZFdFl6QmlXWk1Gcm9YRHJQYUFBL2JW?=
 =?utf-8?B?dnJZeWtYSmhQcmRWMDNaSXFmbS85QXdBVXREa3J5aUNsaEV1bis1WWxhM1pW?=
 =?utf-8?B?QVB0Q3BnMjArNWFJWS9yQUZtYk01MWMreGZkb3BaRjRqWDBERHU0bFVtZTB6?=
 =?utf-8?B?bW9sVDZkTFJaYy9aS0tYMDNxWFNLcm5NY0FNblRuQjNnc0ZtQU9qY3hUU0xK?=
 =?utf-8?B?K3ZURkN6VFVzWWYwV1d2aEk4bkJza3NaVFROY2JDL3pEdG5sQndDMTRwVW5a?=
 =?utf-8?B?cE9ROU1TanlmR0VHRTd5Nk42aVhzbHV2TlRHaW01eWZxOC9Gb0toUFlUazlW?=
 =?utf-8?B?aXVVR1RVYk9HUGNaSUJNY1dtVnVVOVorQU1CdjN3QUwrdkc1WmNuV1NJalB2?=
 =?utf-8?B?S1FubE96aCtwcHpMVkZsSkhYODJsRTE1ZUdNY1FkWnAzRmNyY2l6SG16Tmp0?=
 =?utf-8?B?b2FSS2kwZVlKZ2ovVHhDT3BEODlIeVVRNWxkcE9FazdvOXJTUHlTb3ZlMnJ3?=
 =?utf-8?B?OEx6UmlENS9aQWdSRS83VnNFeU5VMnhSQzA1T0NCNEh6Qzh2THN3bG43Qncy?=
 =?utf-8?B?QmVWVXJqeDNnb25lUlRvekFNQm51NzI1ZTZ6ZWhSTHQ4MW1BS0N5KzhaOTdt?=
 =?utf-8?B?TkxiQllYWDl3N0ErdUY3eWllYjh2V0oxeXkzclptM1BhYnJHcXcyS2xGV2No?=
 =?utf-8?B?bUtROXd4czJFY2JlVTJwQ0lGWG9XMFNGOTMxM0h6WGxETVpIdGVUQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c9b8d0-7030-46f4-9c1b-08de58e6daeb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:16:07.2564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmLVCp9RKBy2v/JqpWMyQiZfl/1Drujx/8PJgGf+doE2tN1WPAdy3YaIhepRsynR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8853
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5821-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[amd.com,quarantine];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.simek@amd.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,amd.com:mid,amd.com:dkim,intel.com:email,vaisala.com:email]
X-Rspamd-Queue-Id: C070556B49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/19/26 10:51, Tomas Melin wrote:
> Driver is compatible with RTC controller found on zynqmp.
> Configure dependency to enable building only when zynqmp architecture
> is enabled.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> ---
>   drivers/rtc/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 2933c41c77c88e60df721fe65b9c8afb995ae51e..46b497524cbfb5d0c1662dcaddbb6d28b4ae2abe 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1376,7 +1376,7 @@ config RTC_DRV_OPTEE
>   
>   config RTC_DRV_ZYNQMP
>   	tristate "Xilinx Zynq Ultrascale+ MPSoC RTC"
> -	depends on OF && HAS_IOMEM
> +	depends on OF && HAS_IOMEM && ARCH_ZYNQMP


    arm-linux-gnueabi-ld: drivers/rtc/rtc-zynqmp.o: in function 
`xlnx_rtc_read_offset':
 >> rtc-zynqmp.c:(.text.xlnx_rtc_read_offset+0xd0): undefined reference to 
`__aeabi_ldivmod'

You should use macros like div_u64() to fix it instead of have driver enabled 
only for ZynqMP.

M


