Return-Path: <linux-rtc+bounces-1822-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCFE9680A3
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2024 09:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 330B91F2555E
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2024 07:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2AF15665E;
	Mon,  2 Sep 2024 07:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="J//+N2NG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2099.outbound.protection.outlook.com [40.107.117.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766781547C3;
	Mon,  2 Sep 2024 07:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725262380; cv=fail; b=dcSehP6v7wGdAY+SyTNgkkPx/B4FNyOmkiR0NWwMLw66akZIHJf+FpOREDouF/GNjFLisDLCMF1vZTXqvEJWqRb/qmBRrWgk69lbMutnfJ6mZM3GlmzPdyPNebF8vCA7XbzIjasmaypFtOzMj7LhT9E+fix6HrLlYRPoaFLh2KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725262380; c=relaxed/simple;
	bh=YVoDmlUdEGGimvetfkji4rKo7rv5u3GkHpHD9AA0+0o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UV3NIfUUvqaXHzVqt+q+PWmALHN910UA42c5IvmbbnLV2e9Y9H+/O9DgqArFbMyxfxrzOn0y6kGALA0rs9zR7grNCKh2PnAD3kTc3X8aXnh9ptNmGSAIfpao/lkZvF/sMrh0zUsJoLqIREoB9I68cgPtKf/VrO3Y9gHGW9aWVSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=J//+N2NG; arc=fail smtp.client-ip=40.107.117.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ap6xYkllN4VuUxurHkfBUKfiP+d/WIqryCF3Y4Cmt+ixP4nNmdQF4y89h8AAsSYDjGgsxiF4dN3fKkDFI4hv1lLHCU3vvTHDxnq1v9ZAmlRZyRRWtwZQJvfxJVf4znR+2oNFvivzk1UnsFXH4vGN8gZXsDz5YhzwcFd41C6uAFQh/0xgRWadY9UJSfKnE2DBUuMoj48CpyhUie4NZqROam8126n5k2cGaSZacFrSTuRPeNN6s6+HHpqvy0wmgkfBejg1I5eBwisFMylKwwGrTaVYq83xKsxkIwMncQQE7+mlO/8p0MZdqnmS4rctOea71FPKcCYFKQszzsqeTOGuLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1bZXYGSV/bEYceMqbG1Nnew16oLZsMFd8pKnSld2kk=;
 b=yG4F36bcKomtHaR4kIIXmL7+HPLFLhoQ1/SQRCh59hcDZBfTPXWNP4Jqi6veSfBTpR3pVBA/bw3puZzRneZ79V62iwx6n5skEWQKK/G/slsViqohX/XVco4BeQ/ng30wvPQ5F1NE/jjh5qGddWfzRJkHdAOTqV5B/dgh1ScVF2V6olOC48j7xc9LYKhT0C4sjoGKksBtKrUKYinF2KGH2EMtvnqV3TM6saDVzc34YQ5WKUwuuSU46uz1Yy6hUh5KkYZVNwtQ+gMw6miqOcVwZkSP6l8QtYMR2i1slw0mf0ki80LeC72fxTcsWLto2oF77KK/KuJP23jeHsCd4MIKfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1bZXYGSV/bEYceMqbG1Nnew16oLZsMFd8pKnSld2kk=;
 b=J//+N2NG/wwP3Se0TtaFgWgg/FoCbJYk8MjbXxK4oHMQrO3mrACJvdHnCNzM9DavlX/VQE/CH6fDNmZXtevNG2J7iPOR9MybUsvSZQg4ZBqKXzdb8PU68y0kz1oCW2rL8h5GZT6vX1avoiJU/kS6XNSljLCRR9x7ly3yXQDmWJz4iEWs+Xon5G0yxsCjPZRk8nvYOSffEWJRyLBeQCEOUXiEX2+uuW7IdhseenzeOY7b22QRUNRx2e0LiI6aLYLzolNGLhueOEzx+VkbmKjL46tGpqBLGoFiGiY+SB9SZBBqe/B5jHYWaUcKgztoYA3v474B544hKOXG6wiRoqpAIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7415.apcprd03.prod.outlook.com (2603:1096:101:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 07:32:51 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 07:32:50 +0000
Message-ID: <e9ebbc1b-0d27-495b-9350-f635ed6ddfa3@amlogic.com>
Date: Mon, 2 Sep 2024 15:32:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Yiting Deng <yiting.deng@amlogic.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
 <20240823-rtc-v1-2-6f70381da283@amlogic.com>
 <dcc28bf5-0b3e-4133-80c4-e677ecb38388@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <dcc28bf5-0b3e-4133-80c4-e677ecb38388@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f63e5c-2c60-44e9-1321-08dccb2172c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzBja0pvaVZTVlZIcXVUemRDTDlGbTRJaklaWEloYTdzQWJ3RGY4bjJmdWVj?=
 =?utf-8?B?dmZiVWJKRHl3NGYxVmEyU0tWVlhvaVAva0VQMXRJQ0tVbzh4ZUhJVUQxdm11?=
 =?utf-8?B?bEZuOGhhNjFMNEQvMUxUcEtvalpWSHpFVUJRVzBUcVJndjFZQ045bitLaFpm?=
 =?utf-8?B?d0c2ZnFoRVpKcXk0eGh6aFgxSG1sYWthWEw2N3pmZ0kxeUFqUFJ0b25TSFpz?=
 =?utf-8?B?WFJLRmFMWE10ejRadkZ4eU9OQkFRdDlSNDdKeXF1UzRJdi8zVDBtdFdXbUpr?=
 =?utf-8?B?cUh4VVNabE9Kb3g0cE5uUkZWR0tqWUgrYVlFL29zL0owZ1dCUXgxZm5JaXk1?=
 =?utf-8?B?bVM4b3RBZlJraENkY0sxSG5PWVRQdjJ3QkR6VXZyZFNaelVLM1NKUGdxQklM?=
 =?utf-8?B?WmV1WGR2TS9YREIzb3NDZERnNmZlVUF2aGhKT00yOXRFNi9WeGl1UGw4MzU4?=
 =?utf-8?B?STEyMURSNS9JOFJXOXlKc3d0Z3hHRGxvNGFudnBxY3U5VVRxeEQzNCswTHdJ?=
 =?utf-8?B?NEFIbHBoQU5oRG4wNmluSkxRVFBNeWJpaG92YUZvWGhudzd4VkhnMVRtRUVT?=
 =?utf-8?B?NDV0TC9WcVZnanJrREdKcUh3TGJkQ2FGaG1RRTNEMm1FWXVxQ3N3K1RacTMy?=
 =?utf-8?B?dzhGNXdVTXpEZDRFRWc5dDB5ZkRxbWU3Zjl0U2s0YWFSY3psR0c2WGVRMURT?=
 =?utf-8?B?L1lUdDJwMlA2a2FTd2d3eldFRUU0SUV6c0d4cGdJSklZL0VlbHg2bFY2Rit5?=
 =?utf-8?B?bG1YL3VHT3pRaHZsRzZNbTYzOFJRUExhb1BZTXlLOVl0ZFJYQjVsczdxWHlz?=
 =?utf-8?B?c0Vuand5YXNDbGRsbEFoc0V4V0NrbDN5VFU2NjlCUjBiMmJiZFpEK0YzQXE3?=
 =?utf-8?B?UzBsZzdUWVg2UG1yazEycmZ2MFRmdFpOQWt1VVdORkFCb3VqcUl5YWFNVFVH?=
 =?utf-8?B?a3dKbE9rUW9CR0QyUmlWanlwbExwd2h1TzhZS0FENlZybFA2VmxVQWEvb0ZG?=
 =?utf-8?B?a1dhMzYzT1RHajluUkxNNUtNR0pPZVRyTC9RRlJiTlo4bnU1N3JHakw5RmND?=
 =?utf-8?B?VkZRQ21kOGM3dzJwWXdXNFQ2ZkNlS3JyT1JrMnFSNjZQM1NESHJKYTE1QktE?=
 =?utf-8?B?eDVUYWVtWHpBNXU2aWtLblMrby9tdGZ2MjVXeENyQW9xdGdzaUdzSi9vUVZK?=
 =?utf-8?B?dHRBdXdmUWZqanZIRWtIOTNESXlzR1JoK0Uza2VSTllpUkY3S2VOZVFES1FW?=
 =?utf-8?B?QS9DYm81T0dzcm9XR1NSZXV1cTZteWl4OUNGV2U2cW1GTXBocmx2bFFZNFgz?=
 =?utf-8?B?Z0dVdE5QbS91S0hLNllUNnlRdmx4cGg5ZzVCUFlGa0VZNU9Kbkc1eEZzVWZn?=
 =?utf-8?B?NTZIdDROUlFYdTliUjYwdGRuN2RVaFZTT295ZytPSG9pNTFzUG5TTXFmcDIz?=
 =?utf-8?B?S0UrUHRIYUpxU09iRFJpQktUL2dHV25PY0FuaU1FTGxyL2NQVTVmRVh3ZTVN?=
 =?utf-8?B?Wk5HVmozYUwyL09vRGM1eGFlOXo5c3pCRlNKbEY1SGR1UTJSV0cvZHN4M1lj?=
 =?utf-8?B?SE9RQXhlbXlNakVJZ3lpRkk0eER0QkY3L0ZtcGVyaTFiR042bVVMVU5Rb0d0?=
 =?utf-8?B?NkphYnNnUGJSNG1zOGJJWEJqSHlUanlKaHN2TWJnWU9TbmJ1d3J2TGVGYXNW?=
 =?utf-8?B?Ky9ld3pnU01NVzhFNTNuWHd4V0E5TEpkamRYQmNuTTBkcFdzRWF4dFRINDRt?=
 =?utf-8?B?Z0VtZ1VQZU5pZG93aUJBSzFWNmFCeERHSGwwQmRCekpGRHNrTWNDS3BQaC9T?=
 =?utf-8?B?OEwwSGRlR1c1ZnNsWk94UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUpFeGkxb2hHMVdURE9veURHOWdmWVFOL0pwQnJaYi9rMDZPbnhRSjRLL0hK?=
 =?utf-8?B?ZXBlVkQ2TjRjamJtdk5xOE5GdUJSa2NlZlkrSnZYQ0ZPT3ROcmFSV0NNMHZq?=
 =?utf-8?B?UFgzdDhmMStvMVZEK3p0WXpEWXc2YUloeW9Nc3JsMFdXamR1YUo1UFlmNjhy?=
 =?utf-8?B?Q2ZtU215am5CaGg5U2RUanVFRGVwWFlPNGkyb2pSdEszZlJZYTZDT05obFRG?=
 =?utf-8?B?VXd1Wklqamp2RVlWVGhObk5mb2RXbGlId3NsQ05MN2JPYmxqN0diYXFhU215?=
 =?utf-8?B?R045amM1Mi81NnFJQUo0TG5HS2t0LzVZU2ZGQXkxdHVZbTZNTFk5KzVOYTFD?=
 =?utf-8?B?Mnd0b3pYeVJBQTZjeUVSVWp6YzkrSGl1NTYwdTZ6SGhoRlEzcjVjYlU2N2RP?=
 =?utf-8?B?MmtOaFdCdStXZlRRQW9XWnlrMTRJL1RpQkZxRklHeGh1Mk9aWk5hQkhsa1p0?=
 =?utf-8?B?L0szdGt4VjNZYWYvWXhqNlpRd0VjQUJLM0diQWwwaDBwdVY2REUwQkZkTlN2?=
 =?utf-8?B?VDhTUkYwVnQ1VHNqUnlhQW5uOFJzN01QREdjOWUyQjFISHVCK1NzMFlYVTZB?=
 =?utf-8?B?ZW9pT1lwM3Q2b2Y3NHZXRmYreXF5amp0ZGpyMTRXSSs0RUtPZ1h3a0lXR0Nz?=
 =?utf-8?B?NVY5cmxuSm56QUJUd3JVN1g5K1NKeUxRQ3k1WGY1VVE1MHdmVU5QOUN1elpO?=
 =?utf-8?B?NytieGpvVDdkSGJYOWpoMHNLVFVZMndHOEZMVE9HSXJGV3VoaURJZUhpeDBs?=
 =?utf-8?B?LzhxeUdiOU81UWNRdG5aSXVuQlBHdm1QNVlMcDFDUUtSZzFieXJ4NWZra29n?=
 =?utf-8?B?clBoZjhpbHRxZlI0bDBPc3lMSU8xeklZR3ZnWExCcXBIdnVOaUJQWG13T0ts?=
 =?utf-8?B?QnlxMXd3dmFaVUhYYjdMNXlSWG9HWlh0WTFZL0lvUEhMY3Q4N0R0UjVkZHl3?=
 =?utf-8?B?cE9IQnlTTmtVUG5hb3RkYTV0TmN3QVF6cTYxQmtCR2JGVkYvd0VKeXdvUytz?=
 =?utf-8?B?VVJ6eVZob2gxWi9HU2UweWZMWU1vV29sTVRlbG01ZnJhampac2FtbmxJVDJH?=
 =?utf-8?B?M3hjUjVEdGhsUEwrS3labWxneVJ2bHVCcWJQcGNVRUhJaGxPOWVoNWxySFZZ?=
 =?utf-8?B?MjBBSUQvTUU2RmlVRXU0QXhrQ2o2TWRpZWtHcWppRmVIS3lwSC9XUmhxRk1Q?=
 =?utf-8?B?anNkVzdSN1Bvai83bjB3UWNOSkFONERIbkw3THNxZnRoai9JeTE1UHRiZVUz?=
 =?utf-8?B?WnMraWcvUWpDSkRNSHJqV1Uwa0hyV1dwSmNaTGI3S0hiMnc0TVlNMFhLNjJw?=
 =?utf-8?B?czI3Ym9saEZZQVd1cURJMWtBdDJWY1ZUNXRwN040R0JiYmYwU252MTc3RlYy?=
 =?utf-8?B?d1RuL1FOUHU5Y0MrK1FEVmdwbEJsMnp4ZzY2YUtTTm5PY2FCT2pSazVUY3N1?=
 =?utf-8?B?elh2eU9IcGtYN3hTU3hXeGQ3Z0t5YVRRY2VnWWFEbVRYR05VUG1sWENHVmk5?=
 =?utf-8?B?V3lxRktUZDR6bXVSWlpZWkVsNS9pNkgrVUUzYWlyamNxR01xcWtxK3hWV2xC?=
 =?utf-8?B?WFpMNmFHeXV3MzdYT3hNMkplUmI0VERmOE1nSjMrbzFUbVIzVVNqaTlPTU00?=
 =?utf-8?B?Yi9VRUxXOHZiYmdySVlVMW9lK2hLZnJuY2pxaFNLeVRBRmxZVnM2cTUvUTE4?=
 =?utf-8?B?czcvTHc5OXFJeWNGSXBtYkEyeUFMMjFiZTZncGxkNU4wYnJNcmRRVUhJUGRh?=
 =?utf-8?B?V0ZFMFgwZjBUSlppdnluRUdOUzEwU1d4QWVOUXNNc2pEd3Q2UVF2dFNmV1V0?=
 =?utf-8?B?eWgxanY3eGpXWUZnUE1zVlBQL2QwSXQwaVpRUGZ2WUV0M21Lams4c0NTUmJN?=
 =?utf-8?B?b0RQRFpmcHFzTERCbUZOMThpRUxCQ3ZQZTdhWkhoSTdKZjEyOWE1djJNV0Vz?=
 =?utf-8?B?amhhNzJTb1J3NGNOc2VEclZoaVhwR0pTUW9vREQ3UXlzMW16d2lEQUdRcGM2?=
 =?utf-8?B?dVRLRkI1UE8ybXNGZEQ2dm1jTy9yckxzOWJWdGtJUmlPRmpSZkQ4Y25EU2Js?=
 =?utf-8?B?UGo5eWFLYmlvK1A4WWx2bmRQRVBFSVhidlh2N3A1TkFVNllDSGhlbUEvSkFW?=
 =?utf-8?B?TWpUVWwvNGVNTzdVcGpMUWhCTmdSbTN2a080a2M4NkM1ZTJzM1dHS2U3dU5L?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f63e5c-2c60-44e9-1321-08dccb2172c7
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 07:32:50.2187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6BpFzlKrMUqoNbJ+gOZgN7UtF46rYXFDLNSxDfLwSija/syAegx7YT5u5pIuEitbybN5jG5BGDUb1EM5KYhWyBTvyLjCZEV3ovU0+hovt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7415

Hi Krzysztof,
    Thanks for your reply.

On 2024/8/26 16:27, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 23/08/2024 11:19, Xianwei Zhao via B4 Relay wrote:
>> From: Yiting Deng <yiting.deng@amlogic.com>
>>
>> Support for the on-chip RTC found in some of Amlogic's SoCs such as the
>> A113L2 and A113X2.
>>
>> Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   drivers/rtc/Kconfig       |  12 +
>>   drivers/rtc/Makefile      |   1 +
>>   drivers/rtc/rtc-amlogic.c | 589 ++++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 602 insertions(+)
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index 2a95b05982ad..0dd042701c3b 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -2043,4 +2043,16 @@ config RTC_DRV_SSD202D
>>          This driver can also be built as a module, if so, the module
>>          will be called "rtc-ssd20xd".
>>
>> +config RTC_DRV_AMLOGIC
>> +     tristate "Amlogic RTC"
>> +     depends on ARCH_MESON || COMPILE_TEST
> 
> So the third driver? What is wrong with existing ones? And why this one
> is named so differently?
> 

This RTC hardware includes a timing function and an alarm function.
But the existing has only timing function, alarm function is using the 
system clock to implement a virtual alarm.
The "meson" string is meaningless, it just keeps going, and now the new 
hardware uses the normal naming.

>> +     select REGMAP_MMIO
>> +     default y
>> +     help
>> +       If you say yes here you get support for the RTC block on the
>> +       Amlogic A113L2(A4) and A113X2(A5) SoCs.
>> +
>> +       This driver can also be built as a module. If so, the module
>> +       will be called "rtc-amlogic".
>> +
>>   endif # RTC_CLASS
>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> index 3004e372f25f..d4a56ddb4246 100644
>> --- a/drivers/rtc/Makefile
>> +++ b/drivers/rtc/Makefile
>> @@ -26,6 +26,7 @@ obj-$(CONFIG_RTC_DRV_ABB5ZES3)      += rtc-ab-b5ze-s3.o
>>   obj-$(CONFIG_RTC_DRV_ABEOZ9) += rtc-ab-eoz9.o
>>   obj-$(CONFIG_RTC_DRV_ABX80X) += rtc-abx80x.o
>>   obj-$(CONFIG_RTC_DRV_AC100)  += rtc-ac100.o
>> +obj-$(CONFIG_RTC_DRV_AMLOGIC)        += rtc-amlogic.o
>>   obj-$(CONFIG_RTC_DRV_ARMADA38X)      += rtc-armada38x.o
>>   obj-$(CONFIG_RTC_DRV_AS3722) += rtc-as3722.o
>>   obj-$(CONFIG_RTC_DRV_ASM9260)        += rtc-asm9260.o
> 
> 
>> +
>> +static int aml_rtc_adjust_sec(struct device *dev, u32 match_counter,
>> +                           int ops, int enable)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
>> +     u32 reg_val;
>> +
>> +     if (!FIELD_FIT(RTC_MATCH_COUNTER, match_counter)) {
>> +             pr_err("%s: invalid match_counter\n", __func__);
> 
> No, do not use pr_, but driver ones.
> 

Will do.

> 
>> +             return -EINVAL;
>> +     }
>> +
>> +     reg_val = FIELD_PREP(RTC_SEC_ADJUST_CTRL, ops)
>> +               | FIELD_PREP(RTC_MATCH_COUNTER, match_counter)
>> +               | FIELD_PREP(RTC_ADJ_VALID, enable);
>> +     /* Set sec_adjust_ctrl, match_counter and Valid adjust */
>> +     regmap_write(rtc->map, RTC_SEC_ADJUST_REG, reg_val);
>> +
>> +     return 0;
>> +}
>> +
>> +static int aml_rtc_set_calibration(struct device *dev, u32 calibration)
>> +{
>> +     int cal_ops, enable, match_counter;
>> +     int ret;
>> +
>> +     match_counter = FIELD_GET(RTC_MATCH_COUNTER, calibration);
>> +     cal_ops = FIELD_GET(RTC_SEC_ADJUST_CTRL, calibration);
>> +     enable = FIELD_GET(RTC_ADJ_VALID, calibration);
>> +
>> +     ret = aml_rtc_adjust_sec(dev, match_counter, cal_ops, enable);
>> +     dev_dbg(dev, "%s: Success to store RTC calibration attribute\n",
>> +             __func__);
>> +
>> +     return ret;
>> +}
>> +
>> +static int aml_rtc_get_calibration(struct device *dev, u32 *calibration)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
>> +     u32 reg_val;
>> +
>> +     regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
>> +     *calibration = FIELD_GET(RTC_SEC_ADJUST_CTRL | RTC_MATCH_COUNTER, reg_val);
>> +     /* BIT is only UL defined，and GENMASK has no type, its' donot used together */
>> +     *calibration |= FIELD_PREP(RTC_ADJ_VALID, FIELD_GET(RTC_ADJ_VALID, reg_val));
>> +
>> +     return 0;
>> +}
>> +
>> +/**
>> + * The calibration value transferred from buf takes bit[18:0] to represent
>> + * match_counter, while takes bit[20:19] to represent sec_adjust_ctrl, bit[23]
>> + * to represent adj_valid. enable/disable sec_adjust_ctrl and match_counter.
>> + * @buf: Separate buf to match_counter, sec_adjust_ctrl and adj_valid
>> + *    match_counter: bit[18:0], value is 0 ~ 0x7fff
>> + *    sec_adjust_ctrl: bit[20:19], value is 0 ~ 2. 3 to insert a second once every
>> + *    match_counter+1 seconds, 2 to swallow a second once every match_counter+1 seconds
>> + *    0 or 1 to no adjustment
>> + *    adj_valid: bit[23], value is 0 or 1, 0 to disable sec_adjust_ctrl and
>> + *    match_counter, and 1 to enable them.
> 
> Messed kerneldoc. You have warning shere. Fix it.
> 

I will delete it.

>> + */
>> +static ssize_t rtc_calibration_store(struct device *dev,
>> +                                  struct device_attribute *attr,
>> +                                  const char *buf, size_t count)
>> +{
>> +     int retval;
>> +     int calibration = 0;
>> +
>> +     if (sscanf(buf, " %i ", &calibration) != 1) {
>> +             dev_err(dev, "Failed to store RTC calibration attribute\n");
> 
> Where is the ABI documented?
> 

I will move it to the standard RTC API to handle calibration.
So here will delete it.

>> +             return -EINVAL;
>> +     }
>> +     retval = aml_rtc_set_calibration(dev, calibration);
>> +
>> +     return retval ? retval : count;
>> +}
>> +
>> +static ssize_t rtc_calibration_show(struct device *dev,
>> +                                 struct device_attribute *attr, char *buf)
>> +{
>> +     int  retval = 0;
>> +     u32  calibration = 0;
>> +
>> +     retval = aml_rtc_get_calibration(dev, &calibration);
>> +     if (retval < 0) {
>> +             dev_err(dev, "Failed to read RTC calibration attribute\n");
>> +             sprintf(buf, "0\n");
>> +             return retval;
>> +     }
>> +
>> +     return sprintf(buf, "0x%x\n", calibration);
>> +}
>> +static DEVICE_ATTR_RW(rtc_calibration);
> 
> Document the ABI.
> 

I will move it to the standard RTC API to handle calibration.
So here will delete it.

>> +
>> +static int rtc_set_div256_adjust(struct device *dev, u32 *value)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
>> +     u32 div256_adj;
>> +
>> +     div256_adj = FIELD_PREP(RTC_DIV256_ADJ_DSR | RTC_DIV256_ADJ_VAL, *value);
>> +     /*
>> +      * AO_RTC_SEC_ADJUST_REG bit 24 insert/remove(1/0) a div256 cycle,
>> +      * bit 25 valid/invalid(1/0) div256_adj_val
>> +      */
>> +     regmap_write_bits(rtc->map, RTC_SEC_ADJUST_REG,
>> +                       RTC_DIV256_ADJ_DSR | RTC_DIV256_ADJ_VAL, div256_adj);
>> +     /* rtc need about 30ms to adjust its time after written */
>> +     mdelay(30);
>> +
>> +     return 0;
>> +}
>> +
>> +static int rtc_get_div256_adjust(struct device *dev, u32 *value)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev->parent);
>> +     u32 reg_val;
>> +
>> +     regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
>> +     *value = FIELD_GET(RTC_DIV256_ADJ_DSR | RTC_DIV256_ADJ_VAL, reg_val);
>> +
>> +     return 0;
>> +}
>> +
>> +/**
>> + * div256 adjust function is controlled using bit[24] and bit[25].
>> + * transferred buf takes bit[0] to represent div256 adj val, bit[1]
>> + * to represent div256 adj enable/disable. div256 cycle means that adjust
>> + * 1/32768/256 once by written once, it's val is equal to 1/128s
>> + * @buf: 3: enable div256 adjust and insert a div256 cycle
>> + *    2: enable div256 adjust and remove a div256 cycle
>> + *    1 or 0: disable div256 adjust
> 
> Again incorrect kerneldoc.
>

This is not used functions, I will delete it.

>> + */
>> +static ssize_t rtc_div256_adjust_store(struct device *dev,
>> +                                    struct device_attribute *attr,
>> +                                    const char *buf, size_t count)
>> +{
>> +     int retval;
>> +     u32 value = 0;
>> +
>> +     if (sscanf(buf, " %i ", &value) != 1) {
>> +             dev_err(dev, "Failed to store RTC div256 adjust attribute\n");
>> +             return -EINVAL;
>> +     }
>> +     retval = rtc_set_div256_adjust(dev, &value);
>> +
>> +     return retval ? retval : count;
>> +}
>> +
>> +static ssize_t rtc_div256_adjust_show(struct device *dev,
>> +                                   struct device_attribute *attr, char *buf)
>> +{
>> +     int retval = 0;
>> +     u32 value = 0;
>> +
>> +     retval = rtc_get_div256_adjust(dev, &value);
>> +     if (retval < 0) {
>> +             dev_err(dev, "Failed to read RTC div256 adjust attribute\n");
>> +             sprintf(buf, "0\n");
>> +             return retval;
>> +     }
>> +
>> +     return sprintf(buf, "0x%x\n", value);
>> +}
>> +static DEVICE_ATTR_RW(rtc_div256_adjust);
>> +
>> +static struct attribute *aml_rtc_attrs[] = {
>> +     &dev_attr_rtc_calibration.attr,
>> +     &dev_attr_rtc_div256_adjust.attr,
>> +     NULL,
>> +};
>> +
>> +static const struct attribute_group aml_rtc_sysfs_files = {
>> +     .attrs  = aml_rtc_attrs,
>> +};
>> +
>> +static void aml_rtc_init(struct device *dev, struct aml_rtc_data *rtc)
>> +{
>> +     u32 reg_val;
>> +     u32 rtc_enable;
>> +
>> +     regmap_read(rtc->map, RTC_CTRL, &reg_val);
>> +     rtc_enable = FIELD_GET(RTC_ENABLE, reg_val);
>> +     if (!rtc_enable) {
>> +             if (clk_get_rate(rtc->sclk) == OSC_24M) {
>> +                     /* select 24M oscillator */
>> +                     regmap_update_bits(rtc->map, RTC_CTRL, RTC_OSC_SEL, RTC_OSC_SEL);
>> +
>> +                     /*
>> +                      * Set RTC oscillator to freq_out to freq_in/((N0*M0+N1*M1)/(M0+M1))
>> +                      * Enable clock_in gate of oscillator 24MHz
>> +                      * Set N0 to 733, N1 to 732
>> +                      */
>> +                     reg_val = FIELD_PREP(RTC_OSCIN_IN_EN, 1)
>> +                               | FIELD_PREP(RTC_OSCIN_OUT_CFG, 1)
>> +                               | FIELD_PREP(RTC_OSCIN_OUT_N0M0, RTC_OSCIN_OUT_32K_N0)
>> +                               | FIELD_PREP(RTC_OSCIN_OUT_N1M1, RTC_OSCIN_OUT_32K_N1);
>> +                     regmap_write_bits(rtc->map, RTC_OSCIN_CTRL0, RTC_OSCIN_IN_EN
>> +                                       | RTC_OSCIN_OUT_CFG | RTC_OSCIN_OUT_N0M0
>> +                                       | RTC_OSCIN_OUT_N1M1, reg_val);
>> +
>> +                     /* Set M0 to 2, M1 to 3, so freq_out = 32768 Hz*/
>> +                     reg_val = FIELD_PREP(RTC_OSCIN_OUT_N0M0, RTC_OSCIN_OUT_32K_M0)
>> +                               | FIELD_PREP(RTC_OSCIN_OUT_N1M1, RTC_OSCIN_OUT_32K_M1);
>> +                     regmap_write_bits(rtc->map, RTC_OSCIN_CTRL1, RTC_OSCIN_OUT_N0M0
>> +                                       | RTC_OSCIN_OUT_N1M1, reg_val);
>> +             } else {
>> +                     /* select 32K oscillator */
>> +                     regmap_write_bits(rtc->map, RTC_CTRL, RTC_OSC_SEL, 0);
>> +             }
>> +             /* Enable RTC */
>> +             regmap_write_bits(rtc->map, RTC_CTRL, RTC_ENABLE, RTC_ENABLE);
>> +             usleep_range(100, 200);
>> +     }
>> +     regmap_write_bits(rtc->map, RTC_INT_MASK,
>> +                       RTC_ALRM0_IRQ_MSK, RTC_ALRM0_IRQ_MSK);
>> +     regmap_write_bits(rtc->map, RTC_CTRL, RTC_ALRM0_EN, 0);
>> +}
>> +
>> +static int aml_rtc_probe(struct platform_device *pdev)
>> +{
>> +     struct aml_rtc_data *rtc;
>> +     void __iomem *base;
>> +     struct clk *core_clk;
>> +     int ret = 0;
>> +
>> +     rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
>> +     if (!rtc)
>> +             return -ENOMEM;
>> +
>> +     rtc->config = of_device_get_match_data(&pdev->dev);
>> +     if (!rtc->config)
>> +             return -ENODEV;
>> +
>> +     base = devm_platform_ioremap_resource(pdev, 0);
>> +     if (IS_ERR(base)) {
>> +             dev_err(&pdev->dev, "resource ioremap failed\n");
>> +             return PTR_ERR(base);
>> +     }
>> +
>> +     rtc->map = devm_regmap_init_mmio(&pdev->dev, base, &aml_rtc_regmap_config);
>> +     if (IS_ERR(rtc->map)) {
>> +             dev_err(&pdev->dev, "regmap init failed\n");
>> +             return PTR_ERR(rtc->map);
>> +     }
>> +
>> +     rtc->irq = platform_get_irq(pdev, 0);
>> +     if (rtc->irq < 0)
>> +             return rtc->irq;
>> +
>> +     rtc->sclk = devm_clk_get(&pdev->dev, "rtc_osc");
> 
> Clock name should be: "osc"
> 

Will do.

>> +     if (IS_ERR(rtc->sclk))
>> +             return PTR_ERR(rtc->sclk);
>> +     if (clk_get_rate(rtc->sclk) != OSC_32K && clk_get_rate(rtc->sclk) != OSC_24M) {
>> +             dev_err(&pdev->dev, "Invalid clock configuration\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     core_clk = devm_clk_get(&pdev->dev, "rtc_sys_clk");
> 
> Clock name: "sys"

Will do.

> 
>> +     if (IS_ERR(core_clk)) {
>> +             dev_err(&pdev->dev, "failed to get rtc sys clk\n");
> 
> Syntax is return dev_err_probe.
> 

Will do.

>> +             return PTR_ERR(core_clk);
>> +     }
>> +     clk_prepare_enable(core_clk);
>> +
>> +     aml_rtc_init(&pdev->dev, rtc);
>> +
>> +     device_init_wakeup(&pdev->dev, 1);
>> +     platform_set_drvdata(pdev, rtc);
>> +
>> +     rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
>> +     if (IS_ERR(rtc->rtc_dev))
>> +             return PTR_ERR(rtc->rtc_dev);
>> +
>> +     ret = devm_request_irq(&pdev->dev, rtc->irq, aml_rtc_handler,
>> +                            IRQF_ONESHOT, "aml-rtc alarm", rtc);
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "IRQ%d request failed, ret = %d\n",
>> +                     rtc->irq, ret);
> 
> Your code is buggy. You leave with prepared clock.
> 
> Use devm_clk_get_enabled where applicable.
> 

Will fix it.

>> +             return ret;
>> +     }
>> +
>> +     rtc->rtc_dev->ops = &aml_rtc_ops;
>> +     rtc->rtc_dev->range_min = 0;
>> +     rtc->rtc_dev->range_max = U32_MAX;
>> +
>> +     ret = rtc_add_group(rtc->rtc_dev, &aml_rtc_sysfs_files);
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "Failed to create sysfs group: %d\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     return devm_rtc_register_device(rtc->rtc_dev);
>> +}
>> +
>> +static int aml_rtc_suspend(struct device *dev)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +
>> +     if (device_may_wakeup(dev))
>> +             enable_irq_wake(rtc->irq);
>> +
>> +     return 0;
>> +}
>> +
>> +static int aml_rtc_resume(struct device *dev)
>> +{
>> +     struct aml_rtc_data *rtc = dev_get_drvdata(dev);
>> +
>> +     if (device_may_wakeup(dev))
>> +             disable_irq_wake(rtc->irq);
>> +
>> +     return 0;
>> +}
>> +
> 
> Where is the remove to cleanup?
> 

Will add remove function.

>> +static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
>> +                      aml_rtc_suspend, aml_rtc_resume);
>> +
>> +static const struct aml_rtc_config a5_rtc_config = {
>> +};
>> +
>> +static const struct aml_rtc_config a4_rtc_config = {
>> +     .gray_stored = true,
>> +};
>> +
>> +static const struct of_device_id aml_rtc_device_id[] = {
>> +     {
>> +             .compatible = "amlogic,a4-rtc",
>> +             .data = &a4_rtc_config,
>> +     },
>> +     {
>> +             .compatible = "amlogic,a5-rtc",
>> +             .data = &a5_rtc_config,
>> +     },
>> +};
>> +MODULE_DEVICE_TABLE(of, aml_rtc_device_id);
>> +
>> +static struct platform_driver aml_rtc_driver = {
>> +     .probe = aml_rtc_probe,
>> +     .driver = {
>> +             .name = "aml-rtc",
>> +             .of_match_table = of_match_ptr(aml_rtc_device_id),
> 
> Drop of_match_ptr. You have a warning here.
> 

Will do.

>> +             .pm = &aml_rtc_pm_ops,
>> +     },
> Best regards,
> Krzysztof
> 

