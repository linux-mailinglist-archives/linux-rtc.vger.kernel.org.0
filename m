Return-Path: <linux-rtc+bounces-3212-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE5BA37E63
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Feb 2025 10:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CCD0188B7ED
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Feb 2025 09:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B12B212D63;
	Mon, 17 Feb 2025 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="kLakgr6L"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011033.outbound.protection.outlook.com [52.103.68.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A83B155316;
	Mon, 17 Feb 2025 09:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784398; cv=fail; b=pA77/mPmR4fiY58pEz5P05IhELxWdOGTdiXTjQ/AvAmd9LcHsCt7uQaMpyX+X3lK9/BW+LHFYdGOBHyzc2YTHhPW4WHvaXQjSNNMhu2EXsOaK3XM/B/guY686gmci4Mj+0TCbEuYmR1mq/5cp4Ev5z4GKgkO2y/vKmuZ9h326KI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784398; c=relaxed/simple;
	bh=h41z6MGN6JMHl718yu+YmZE+db9paNi/y5z49Z62h1Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BPJCk25n6LYSWAcz+xzys6l4XztI/NEyqVV9j5FTN0la6CcIwrbaDEIqis1kFfLIIoIMuGM9fm73QcrkKsDBYb/gSManEytLo/5vDxGUUTTmFBbUbP5Bgt+rGvFIhP7BH2uYh+mJcEr5vSDcoSgHBzqfvU3YW9tCxxvuu3npCgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=kLakgr6L; arc=fail smtp.client-ip=52.103.68.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+PLKiYAmzqq79D9mmtft8bUFtscCyn7dgYMP6+ClzSe00fNV0uenXMORG47yF+K7x5vOhGnCp3pT38bNHfRXaQD2FlsB/ucAjRmdtfzmAQ0V+Zd77mF8j696VNFb2Z/CsaEOwNrVx2U1XfL6u27njtjPxfNXaqsUkDn6OkXmXTZClevTMBAwdvOZQkQ6a81RGTgVHlyHac9og33twK7OdaZJ9YHqwXzAN34X6Kkv8FTJK+l/eD7CSiCxp2qj+SwF5sibHK846w2tpyJGDs3CU5lLqlaJnglMIlDfeblzFJcrwTfsnA8t3VF4kT6bCHOb160oHI40YyiwVDt8P57/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJyccMl5SrvZ75ed3kVjT0rC4M4G01AG+1qfT9MYRSo=;
 b=xqDv2oqMLUQ0pFdY0T/J4hxmMjOnrWb0y0Sq89VMDZLIvin68N7CEGq0jNQk8nV0/lDUSJf+sJn8Iih87Pjj/lqhgKaUylrKiuAuGPvAqMvWv/TK4CgZk+I5zPnKEdMtoMwAy+aeNPIgeYZ9MrnOzW07j5GnxzA+W5CyfXWoT5NIV+4tsz6cwjhF5CXmazkaqQqSkWDuYtMo08hLr0yVFHF4vLYjVSSQVh7wjigcjluPogDUU/+A2fhM7UNUxRqNBp/JMj9iz/GN2442y0z9LIKofo28SFApPRjoQtODd58m1RGZ5qwX3mZpON8PH6FlJrAkyPKKn8/HP1MqRnRknw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJyccMl5SrvZ75ed3kVjT0rC4M4G01AG+1qfT9MYRSo=;
 b=kLakgr6L5Owws3YkS/0naz/qefPI90A5t9YMxyd+6LfCgCb93D0qKi1XX3gWSBdBA8eXLzgD54IBkaHppp0t8Vt6sTzsZywiI2P5J1rR/Of4A/eC3+gDYfe5hSaa96z4dycHBnmywNJ1nE6JSvoEHrM0mx6H/lstqPeT/kPMu+6WtK7Y8jOQyhx+Dm7HbaZ8SmJWjuaooF/DJtun8xhghi6K1pYjiXH8bucTituQb6fR5Ts9QqIrqAVOMMqmQjZwWOf1rmx1e66VM4gIpkBP7szO1gZ0dzvTNVEFVqUhmEOyL0H/ZfNDjSXX0O+oCVjl4OAI3kl4zVexC9aCYPgqXw==
Received: from MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6e::9)
 by MAZPR01MB7374.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:53::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 09:26:29 +0000
Received: from MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6e06:bc2e:85c0:c2ee]) by MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6e06:bc2e:85c0:c2ee%2]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 09:26:29 +0000
Message-ID:
 <MA0PR01MB567164E6BE03750F2200CBDBFEFB2@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 17 Feb 2025 17:26:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/3] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, dlan@gentoo.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
 <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0139.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::19) To MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:6e::9)
X-Microsoft-Original-Message-ID:
 <a065d2e9-b5d1-4d9d-832a-daa0e90dac04@outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0PR01MB5671:EE_|MAZPR01MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3ef208-cdd9-40e4-1cb2-08dd4f3528ca
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|5072599009|19110799003|7092599003|461199028|6090799003|8060799006|440099028|10035399004|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGhEeUZBayswVHFzMHQ0NzN0elM0WC9iSXhDWk5GVjFuYTRnczFJV3J5cXlR?=
 =?utf-8?B?VmxBdGJEdFpVdWhKRFgxWnJ0RWc0TkhrbHB0RDIzb2pGZU5nZ0p4L0pLTUx1?=
 =?utf-8?B?bFgyTCs5UUY3Y1h5blNqV1o1MmYvTS9kNy9rOEFzT2NteXFjYStkNGZ1Vk84?=
 =?utf-8?B?VEh1NW1Ca3o1Nk0rSVNXNmhmRHc0UGkzM2dOSkdQNFpsa0tqNXdscEFUWFN0?=
 =?utf-8?B?VGRHSy9JejUvc1A1Z0RBVGVwVzVDNjFrNDZKNnZ0Ukc1SFY4MlBleVFPUUNu?=
 =?utf-8?B?cFVEby9JVU8vcFpqQ1gwNDUvN3lJYmlGek1XN0x1ZXNYcHZGM3F2K3RUeXNm?=
 =?utf-8?B?MTFWaldiQ3NHdTArWDNWWXFHQ2JWM2hBb1gzdGpJU2puOVI2WWtjWVVLeW5I?=
 =?utf-8?B?LzcrSzJIek5NN3g0Skp1TUxMdHp1dDJuU0ZuczF0c2wzUG1sUksvblFkZ0lh?=
 =?utf-8?B?ZkdoaFo1S2lhb3hOb2lIUkZYUTZSczZXUDhKbDkwa0VhYStjU2Rab1o0U2E3?=
 =?utf-8?B?bnpMUTE0d3Z0YW5EdXZiRGxIa1Rwa1dlRFRzVnJYMk1ycFBSL1MxY2hwaGVx?=
 =?utf-8?B?emNqTTRYclpMRHpYekxpV1Z4Y3N2UzE3eTN5aERFN2JWaW9zclpvUk43bHl5?=
 =?utf-8?B?SjQ4RkxBdHFYUjJ2TDVvKzdzclRnZy9pd3hURi9hV2EzVUU3ZTJnbW1tRFly?=
 =?utf-8?B?d1RzZmdzemNIV25WKzhpc1Z4Z1M0b1BZRHVqbDZ1KytLMWZYdjFwWXczQVd1?=
 =?utf-8?B?Q3R5ZnllUmJJK2Z0bEdKNGtycUFjZlA2MTdwMDM4UVYxRkhBOGJWTFc3dnJK?=
 =?utf-8?B?eVFGY2RlajdoWTg5ZkxHR3N4SEdMRG5rUkNlV3dNNDVOV2QvU0NtME5PNjZh?=
 =?utf-8?B?TW9MUFV3S2xRMm8xVTBybDk2T0JHQWIrcE9hMW5jeGdjdmx0SVRVYmswY09v?=
 =?utf-8?B?bFBlWStMSStPb1BTbVJGYzZKdlNsOHpsK0VvQU1NQytJUUNVQ2JRQjg1MHQ0?=
 =?utf-8?B?OHhXdUwxT0RNRHFsTHU1WUU4c3F3dUFUalB0b24rR3dvVjRYN3RKc2JDcjI5?=
 =?utf-8?B?L2I1U3lYUGVEYXNWR3BPSy8wVmN3Sm1ibUxhbGV6MHZ1SDlibTZUVkNUdjFp?=
 =?utf-8?B?YVd2bi9xZFpaUDJNaDZMT09XaVh0RmZGcjdOaXBJUTlZZ28zVkZjVk41MEtJ?=
 =?utf-8?B?dE9WZndpOExIRjdSOExSdnFDeHhkUTNhakZkWHFzZmo4SE54bnFlcDNQNzNL?=
 =?utf-8?B?UTRRendtN1QyMGxKYUdQUHYwWjNFNXduMWtTMDVjMGlPR3JSYnltcGh3eVh6?=
 =?utf-8?B?cjlLZVRSUmYzUThvdTFyWmh4ZVBqdk9QOVQzbWIyKzZ2bVBZUkpnc3h6VUZm?=
 =?utf-8?B?NkFTczdsVDBjajBlNDJrTzQwdnJocUN5SkJUblpVS0llUVNnTzRhWmdaWTh1?=
 =?utf-8?B?UU9SYWhpL0Yyam41SlV3V2RKdi9HdXQ3eWtJNDZmbjA1STZFbnZRTWdvTE14?=
 =?utf-8?B?QlFyaHBKQno1Nlh2YjF3cFhBSHlrUWFweitRM05pUXRQS2dRb2loc3RLWjB4?=
 =?utf-8?Q?eZS+599iHfmTh+z1hdE5NrCtk=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlR2d0l3YUhjeW5Rb1lZSGdNVWRsakpwcGQxNVVyalBKeU4zZVJaMEVVbWdo?=
 =?utf-8?B?RTNxeis3TytuSGNlQjhvbVpwOU12Vk5vQUtwTFZjNXU5R1I3d3BoMzV4NVNN?=
 =?utf-8?B?ejBFU3huK3dwRXUwR1lOa3lZSGhSU3JhazFNMGNBMVlnRVE4WHdDZDFiY1Zz?=
 =?utf-8?B?Nmw3eXhBRnB4b3k3b3JDWWM3UVpJeWhLNUkyc0c5a3JSTUl4NWdMSVU0N3Ux?=
 =?utf-8?B?ZGF1RUZyVzlVd2NsSDFTdnV1U0N5S3ZOR09KSDlBN2RvRzg0NDhUMms3REp0?=
 =?utf-8?B?WFI3MzJkNkp3L2tEa2VrRXNGS3VJZHo0eGtId05EWTBmRGRBOHpQSkgyVy9z?=
 =?utf-8?B?d1Q5eGFkTjFGY0IvVWZlUDNWYVYzQ1pFYXNtejYvSFZteTMvd3B0WGZRbFo0?=
 =?utf-8?B?WXNiVU0zdFRDdDR3V29QSWRRNlduU0ZkcjhINlpWYlRXdXc2YnlnVGtCK2Ez?=
 =?utf-8?B?UjVNeVZzQkZURnZkWExkS2xnd0Q2TGNVc205cFdLMmhBV3F2S05tTE0rdksr?=
 =?utf-8?B?cDhuS0hmNERmSjFiQUJya3R3aWJTOGFxNGx3bXl1L081WnZtZndnVEZPT3hF?=
 =?utf-8?B?ZnlnVVVNMkw2blI5M00rcGpWR0RSaUNsb2FSSVNHZ2FZeG5QSmVEWG5MRndu?=
 =?utf-8?B?T2svT3U3UkZDRUZkS3R1T3J5ZkZHdy9PVERsbGlidituWjRXcnFiTmtQcENj?=
 =?utf-8?B?R1lyRmF3SE5obnI0aWZlWldQT0ROTWVMUURvd1E0NFhxNldWQXNVSFZYb0JD?=
 =?utf-8?B?TzBlM1Rpc3QveHhOUXJidGxRWlhwdi9RdW1qMzl4NUZ3dEZDaWl0WFJVKzY3?=
 =?utf-8?B?bmdMU2N2SURxMCt2TExGN1o1UXBCNmJiWWt5WXpseE4vcU5rWmQxNlE4RzFQ?=
 =?utf-8?B?QkdFbE5ObkJuNXhUNnJySytTQUNJTmV0eUxicis2YUNyMFF0Q2ovRVRJcEpX?=
 =?utf-8?B?RHpvYXVpVjJUdythTUdnQ3BtWUtZN0R2cGFrQkdtTExYRnROTWpVSHBZSkxX?=
 =?utf-8?B?VDRzaTZIQndzcWxTckNXL0NRVGhQUmVzckdFc01HbkdPSDBGcW5EeUZjTjJr?=
 =?utf-8?B?V0FoVXVTSHF4aGZCeFFnTW15bURNSXQrZjdma3F0YnI1TnZUenkzWkFFNUky?=
 =?utf-8?B?NG1aeHJraHNsdDFkblNvMTJmQ090WUw1OVV5SGQrTWFDUDg2S3NsZzhmMXBD?=
 =?utf-8?B?MkI3eE4xSXY3ZC9EbHhDRVZBNjB0OTdtRGJoeEFNZGkxaE1ISVQyb2dncDNO?=
 =?utf-8?B?VE9yRTdsWUpDM1RPdzRFalo2NGhERUROSmhRcXdwMFFkYm9PWEdyV3R5dHRB?=
 =?utf-8?B?NGRXZXo3enE4QlVmM3R3SjY3RVFZa3V4bE5Kd2QrODZPdmRHT2g5cUZ0WnBr?=
 =?utf-8?B?YXloeDl6UHF1dXliUHZPditWczBJTEpwMlBRcWNvNDlHYXhBZk4yQnpRaXlV?=
 =?utf-8?B?RG1Fc1lFRkY1N1NlQXlVZjg5NUFsVXVxbjhVbXpSTWo3MTNWUXRZNFp3ZUxm?=
 =?utf-8?B?Y1JqMHNQSStFWlhkUXpKL2ErMDBSR0lqNWNMRDhPS2xWZ1I5eFd4UWJYTDZv?=
 =?utf-8?B?ZEZEQUZUanQvWnJ2cHBqbDE0RlZ2WDBoRndkckI2blBhcTBnQnJDWDRGN0FX?=
 =?utf-8?B?SWVKb3hnYlVPRGxuTHp4RGJqemZZdFdacGI1MS9RZnl6VzQrT0FnSmFQdGlT?=
 =?utf-8?B?aDFMc01MK2pPTzlweFIyNlhuRUsvTDNvWVFSS0tUNWxwVHZiSmVpMy84SDJ3?=
 =?utf-8?Q?FVw2XyxVb/9PTUMxDGJP1EiF8S80CFb6cByy/iO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3ef208-cdd9-40e4-1cb2-08dd4f3528ca
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 09:26:29.5784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7374


On 2025/2/14 5:56, Alexander Sverdlin wrote:
> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
>
> Add RTC devicetree binding for Sophgo CV1800 SoC.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>   .../bindings/rtc/sophgo,cv1800-rtc.yaml       | 53 +++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
>
> diff --git a/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> new file mode 100644
> index 000000000000..b36b51a69166
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/sophgo,cv1800-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Real Time Clock of the Sophgo CV1800 SoC
> +
> +description:
> +  Real Time Clock (RTC) is an independently powered module
> +  within the chip, which includes a 32KHz oscillator and a
> +  Power On Reset/POR submodule. It can be used for time display
> +  and timed alarm generation. In addition, the hardware state
> +  machine provides triggering and timing control for chip
> +  power on, off, and reset.
> +
> +maintainers:
> +  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>

I guess Jingbao will not take this role. If he doesn't raise any 
objections, please just change this.

Jingbao, do you have any comment on this?

[......]



