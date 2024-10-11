Return-Path: <linux-rtc+bounces-2166-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 267E799A22F
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 13:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D4431F23C61
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 11:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DF1210185;
	Fri, 11 Oct 2024 11:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0mEWYFec"
X-Original-To: linux-rtc@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E3B14293;
	Fri, 11 Oct 2024 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644446; cv=fail; b=JRhSN4AJjyy5vXUs2/cXrQrcOsaEzUvE37QiUDtB9zSEx2jlNTfPbsW1ppZRVso7Ygh/RJ8HJO3Tgo2GlMigV21kF0HCajLLa2A7nPQRhfZgza8sUrySHbh0zxienRUT387uFpU2Kfu9PFM+B24rFDpZsltqOwEBxptKIex4Wpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644446; c=relaxed/simple;
	bh=F3we9kN3nBUAm31gA0hHozuBidVJHO9P2cfeLqQIiEI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FMnSPZPdQV3C8b6/e4smkUllp+VjdudMLNnzA6fvova8VnBXhB6w2xyCltgVf304x73c2p3a2bSOIrhZXmh4FhgZnezVts0zZS3Q5PGmNQzrm7wFsw0iILEXl3vTcjwZYB8rwzVL0yP72YLshRVXLSxILwWisBmePxrzeUb81B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=0mEWYFec; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDh58m3rkXzb8POecG2LRk/YOXWzpunmIRVgnuM6LFMXX7SNlKJCLrbBTnPGAEPydY5hI+YfsE+SWePqAjWcSMBibOd4THsiKyJNUCT+KQSEGXCiLR4U9EY77G+L6Hb6ub2ZYp61xRfZ58EA/Q1qUp9eY++NsxqeTgWBLhmygONaUW24VccA1UbhrF40pIpvbiiHd8bUSQPTMrLYDofmu/geZ5wEcH6vUQM88jWRzLIal1RX96Y0uCzj/ptsaFQ4Hia7+xnwDCh7JRy8InQ0+whCm//Y7oER1sTi2jthaFwGohLpi2EYgPEHP3dXUnG9ky5uEBlYq/DaNserh7ovhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3we9kN3nBUAm31gA0hHozuBidVJHO9P2cfeLqQIiEI=;
 b=pV5OSZeH1Q/DuQdrvbEUFS+fvDyOD2SYOO5vI0yQOk47t2Rj/uCsZyO9qBUyr9UjnmfPEdDnH9fJlZrLOvSKMwXg7XNnspsa9R/bLSrjehgQiQs4aPJXjGFKEJk5PW3U+CcjW2omZoy2SHcxgVswueRpWt3c2eTYzgLx6X+FLQDCnXaXoQZxctrqrVkfM4LDHZguMVgbMptSsW+WCBPxsUe1s1/sBpsccIlrc60VXq3O1gL1GH0+0eBEjAQoq4XTyXWoDaK+9mDm9aZ//5nBACLmqOsSVyYd1rTZvxwo503lpd2NmYj3nV9Q0u1ruaIdECpOi9cYnL5twrdm1dxrhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3we9kN3nBUAm31gA0hHozuBidVJHO9P2cfeLqQIiEI=;
 b=0mEWYFec0KLeH9nu1SFPK5+eausQTh9NDDcMbV3k1qlVHwA4Ak+WgvnCPEjo7LkMaNn8Ylr0XceN6euf8UkknsZ8khPzZl4WluLphmqNLYJvmhdf0wMSasLo9HZbE0QIxOC5CKW06/QVRjS8+3GSJOzvaeXuJQyKkv5pelF69kisVq3Hwl3JtcwWoNhqsmO9bIMT+bjYsm3Wck6u391APtZjuPFHAyHurHy9PKxiTX0EFhvVS7goP3Iak/gkTNJCZ5kIsa7iT6396ZBvJzUYMnPaWgr/nvxgT/fsQcghxm1eWi2ZI2+Mn9F9K3Z4riARRgI1efHD3pSvt8oXuH1fLg==
Received: from BN7PR11MB2723.namprd11.prod.outlook.com (2603:10b6:406:b9::25)
 by DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 11:00:40 +0000
Received: from BN7PR11MB2723.namprd11.prod.outlook.com
 ([fe80::66b9:8eb7:46c3:f39d]) by BN7PR11MB2723.namprd11.prod.outlook.com
 ([fe80::66b9:8eb7:46c3:f39d%3]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 11:00:40 +0000
From: <Conor.Dooley@microchip.com>
To: <alexandre.belloni@bootlin.com>
CC: <conor@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Daire.McNamara@microchip.com>,
	<linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: rtc: mpfs-rtc: remove Lewis from maintainers
Thread-Topic: [PATCH] dt-bindings: rtc: mpfs-rtc: remove Lewis from
 maintainers
Thread-Index: AQHbG8oEMabz6MaH40eQeo4LTJ+OM7KBYfWA
Date: Fri, 11 Oct 2024 11:00:40 +0000
Message-ID: <c565f64b-9d5b-4dee-945d-44be9762282e@microchip.com>
References: <20241011-boozy-blinking-f76d3891dacd@wendy>
In-Reply-To: <20241011-boozy-blinking-f76d3891dacd@wendy>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2723:EE_|DS0PR11MB7736:EE_
x-ms-office365-filtering-correlation-id: c4036480-1684-45a0-d002-08dce9e3f1bb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2723.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MS9uZ3V1TGJSbG1UbmxlZ0h0cjhJYnYwcVBPT0pINmtvMzhNWklXR2Q3S2dr?=
 =?utf-8?B?NVdKWmFEcHNpMSs3bU9KUTVNK09qLzV0bUVWL2hmbmtaNjF6WW9sbXFydjcr?=
 =?utf-8?B?T0hIcit5SWlNcEVsUHAvVFBsZVMwNnFENURuYWFQVElQcmJEd3NhczBYVjFE?=
 =?utf-8?B?NGppeHBZdEh1K21lVjh2QjkzaG1uU2F5OThvTWh6aUZhWTNUeVZBS0xGY0dY?=
 =?utf-8?B?S202OUJib2lycnI5S2RtanNGc2RrVkxBejFYS2pNb0drUDFGQzY4dGZla2RL?=
 =?utf-8?B?amVJaFdpWTNqNzZHMW94T2xFcFFpbDBjcGt3ODQrYll5Wk9Sd1oxWUJKSEJw?=
 =?utf-8?B?ZkZNUW43SnluL3NVNEJLMGtGMlRpWDdFeU1kQVVaOFpNM3JrbzdrbzhzWVVU?=
 =?utf-8?B?d1dVTUF5NVZDTGV3OEx5eGo0NURCMXV5TEpZZ25XNitEb2xiQ2V4czhVY3JM?=
 =?utf-8?B?NG4rOGk2ZDlyMDZUcWNIMnF3cFlUYXRDWFFiT2FHMVJUVC93ZVl3Z1kyZklt?=
 =?utf-8?B?ekNnbURMZzhtTTA3QkZNVDJlVGRUNmdITXZJeW9yT0xkT2FCTzFQQnBCazhm?=
 =?utf-8?B?REF0anpIUVVmMzNJTGNtNXZnWXo4MHFPUHo5RUtycnREU2VPelZKek9JL0Mr?=
 =?utf-8?B?KzFlNm94TVJjZnIyT1RkN2ljMkZIeEJueVRVNWZYY1ViMC9VcXkrb3ZyYmVD?=
 =?utf-8?B?bWJmcHNtRXNQaTdsRjFRNVhwVU1uMWFQS3VKUTJyRUlWRFk5V2RUVHNXeWxM?=
 =?utf-8?B?YUZ1aXZkTVJ4ZkJHMmlxWC95b0JrZmY2S0JYWG9sYW5vL1ZEOEIxelo4TGNj?=
 =?utf-8?B?bHJLeXM3UGEvaXg1bHhDaFAzMjIvbklOVTJDOFNPQW5peGhKRCttMUNOMjAz?=
 =?utf-8?B?STRnMkhLWnpoakE2V3FraktnRGFmV3k5VjhubGlkSGdXeGVFMWR4bS9vYkhK?=
 =?utf-8?B?MnV3cUpzb1kydDllWHRqZ2tEMkhmYXlSaW5HdmIxTFhvSkFDWUljd0xYV21I?=
 =?utf-8?B?MHRWaUZFU1lsNnp1MWxmaXVvaDl0YlNieitXOEtpN2RRVklGQ1h5MWRDUktp?=
 =?utf-8?B?NERldUR4dTFiZjlDRzV0R3djK0xUeVhwVGFYbmEzeTVybndVV3p4emZzcHFl?=
 =?utf-8?B?NEVaQ05TcWNJZ1FuQjRSVzVwMGpLOVVySktnb1c2Y1c2NjE0cURsK1p3Y2ZR?=
 =?utf-8?B?SFNsRVc1TzY3MDJmN2Y1RSsvWGpGTE9SWjY3NzNmQ01qWWd0UWZNN1ZHSklE?=
 =?utf-8?B?cWMrb3FMNDgvTTFmYUQ1a3FIRjV5bFFXY2x3UEh5UUpHMHJQVnVWMUdxQmNj?=
 =?utf-8?B?ekpaMDVUOHJ1L05aTU1lWUxBMFhWaHhuNGszV09SYmExdGVGK2FkdmhUdGdp?=
 =?utf-8?B?QW1yUnA3anBSVGdyTmdZZHRwRzFNTVBqcjNRQkJGRkVpa2VicFhFOHRMWVhM?=
 =?utf-8?B?OHF6dXp4TkNSR0R3OEFOTkJVMG96S1hqcXZkWkFwbHlzTStYa0VWSFZQdDVi?=
 =?utf-8?B?M29LZU1lTnh4eW1nWWx5WHZPSVZxZzl5OVIvYjNhUXEwaSt2V0FWRWROR0JX?=
 =?utf-8?B?UTVBZE1JVTV6eDNRNnR5am5KZEdmdTd3QmFPU2dQT3VPNGJEUHlKdW12N0E1?=
 =?utf-8?B?cGtZbHk1SGJjOEVWeTdEekQ0R1BwaFg0b2xWcTVhaDFvdTgxUTJlWURtWnFI?=
 =?utf-8?B?bitmbXF4S3EwbFdZeEtJMHBGMFFnVDdDUVJVZy82OVZBSzl2MFE0MTFTQllH?=
 =?utf-8?B?TnhoNmZGY1dScFVJTVpKWmV1alErNTRNcFI1eC9uQk9JZ1NJam5UVGdXNEV4?=
 =?utf-8?B?NUxVRXFSV1pkRWdwZit4QT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WHNnT29iNnVYSWp6NVVBc0xHYnlZK2RVS2dOYUtsWW5wTXBoMXZuczNjZWJl?=
 =?utf-8?B?bDJtYkVSN0IwWUVlVTNtcDY0VHVzZzU3cEpnY3pYQTQvSjFQVXljRWFiZzlO?=
 =?utf-8?B?M2h4eTVEQTRTRVpZNkMwU05hSnNjQjl3QWMyVnBFNHlDMnVqN0gzNzBYQ3dw?=
 =?utf-8?B?UzYvOC9ZdEg5TDVkeE8zMWxaZVVpbXBreE1WU29wa3NpaXJxaWNrMVRYSVZs?=
 =?utf-8?B?RFl1MDZkQTN6ZEFZWW9kT0ZEdGNRb2xUTm1zQ1JCV3RwcVN0SlBkRHNkVm40?=
 =?utf-8?B?NEkwL1M4WHNRYVJuL1RpSVRQNDg0Ry9YNFM1Ym96bEErYVUvZk9YUm13eDdj?=
 =?utf-8?B?RVJBaS92ZUZKYkR5YmF2SFJzdDZBcDdUaEptYzQzQzdwNXJaVjdwVG9GOHdM?=
 =?utf-8?B?QkdteDhsVm9wcFhjSVRGNy9NbytNNnVHQ3B6WHJUQ1RtZmhTVmhMRGNkblQv?=
 =?utf-8?B?UDBBcC9CeFZQQU1sanU3L3pVVHR0eGhkbVoxY2Z6NlRIdnB3dXgxYXhqd2Nj?=
 =?utf-8?B?RnA2ZXdWSFBXaExaNnpjcHVEdjhSMVR0WWo3Mnk0S015QnVPUzZDUWtWam9t?=
 =?utf-8?B?NTRVNnhrWjVjdDN5ejFXTUZmS2RjVTZKeDNTU2pXRjVWOEhrQU1FWWlKRXo0?=
 =?utf-8?B?NjNQN0FCY2FIUmlHZHg3MUFzaXpUQVdXZW0xdldNZEFxN092UWVmcEJuQ3VZ?=
 =?utf-8?B?S3k0UEk4dW5pbktZYnRpcUlVOFhUZmVJNlRmeHlhMkhlMmEvdGtEUzk2akRr?=
 =?utf-8?B?dUJZY2kzVWc0TkVLODAyaVZJVkNSZFRhTWVmS2xxMDFhQ3NEdi9NMFJhMkVm?=
 =?utf-8?B?NTdrWGVRZFIxcW9qQlV6WG9LUnV6ckI3a0JKdThnQ1dvYWpPWFZXdjYvTklX?=
 =?utf-8?B?Rk9TSW9RUktGeC9yeTNCRVl4TmtMR25BNDJLU0xIR0hBZis2dGdsaUJGcys3?=
 =?utf-8?B?YzdQOVRzazkzRElqbjgxcU1oLy9rVkRKOEkrUmFFeWVYaEt2Y1Vtc2xzdlVY?=
 =?utf-8?B?V2lINlRUWVcvblcwY3RTYm9HQktzcnpLTERaMHNZdTY4a0lqS0U2TGNUQ0Ux?=
 =?utf-8?B?Ylo2TnlpemcvRmVQRHV2ZTR4amZISnVhblJSRXkyTlpoSUtISXlxeURjdzJj?=
 =?utf-8?B?YXErMGxTTVZFOWRrbDhpQzFFSDF0bmk1S3crVUlZblNVcEZDQU02VHpqM1RL?=
 =?utf-8?B?TkRJK1dtL2M5NnZiNEZrWERVSnVKWnBqbTZQYVFxYWdETHVMYXQxaWlPOHZN?=
 =?utf-8?B?em5WNjUrL01GK3Y1TXRReG9NdEIxNDRZOTNKTnR1WndiZi96b1FUWTBCdENm?=
 =?utf-8?B?ZlhEcThtY0VGR0s5VDljMUp0MDRlc2lzaC85eVYwMk8wK0FFRDA1Yi9aOU5i?=
 =?utf-8?B?Y1FudEk0L0pROE9tREJZaSttZzhwZHQ3NzF1azcrMzdPaUw3UHJ4YmJMRmZG?=
 =?utf-8?B?Y3VTd0dzRWZoZ3ljVVM1VEoySmVHOTl3bUlBL0JpczJ2Ym1MRS8vWHhnaTdr?=
 =?utf-8?B?Sk9lOXlmRGZ4UXBUMUw5QnJaeXZReFJjOXM2N2lpN2U3WVRTZ0RHRHJjVll2?=
 =?utf-8?B?aW1OTjh4NHkycWFMTmVVZ1huU2l6clNEd0U2Qm9qUWo1STdEeHg3NEUvbFM0?=
 =?utf-8?B?SDFuNFE1RS9nd2xsRDdVUHNneVR2UUlJczlvaTJ4U2JjSk1Fa25uRXBPQytQ?=
 =?utf-8?B?c2hNSTRYcjlXOUFHRm1QTUhoSWU1Z2R1THJiRW1UTEdWTDNVN3dXZ3lWTG5J?=
 =?utf-8?B?by82V3VGenFMYVY4bVpSSVE2YkgxZE1uYVBtZG1xazF5Q2M1WjJpVzVaS3hr?=
 =?utf-8?B?bmpOUUU4MERZRmRaQXVWd0w0SUJDYno1bENEZVNOR1RqVVRnTmxWSnRuNCt3?=
 =?utf-8?B?aWE4ZVVVZFJMVnhFTGlNb0ZtcGJkMlQwTFNUL0VGV3ZOUWlUVDJYRmJrMlpv?=
 =?utf-8?B?QlhpbHhCTENKcmdWU1VvRjY1eHNwUzB5Tlhsd2dRa1o2YXdrdXhqTUFKU0xr?=
 =?utf-8?B?SWJ2SmpRUjFCRUhhbFNhY09lbVR5K0x1WTZOUktiR2lQa2IyUHUxOFZGUE1G?=
 =?utf-8?B?Nm9PbUNGMXFyTWR6RFRsSXlvOGdhTTJsRG1FMGE5bFZRME4xTHlQYjUxTitD?=
 =?utf-8?Q?XzgZyms48TcPonQqAOe3Nj7Qu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <16874AC61E03CA4187835793FBB1ACA2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2723.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4036480-1684-45a0-d002-08dce9e3f1bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 11:00:40.2046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ACn1q0IKUSW3AzTronaLSoQeSb5GrvqwkGesz4W+Y3AeJ2Ult7b/8mDK0p3TdIQlW+hxE9vcieNpDvbDHa4I/XQrMbylXkfluU91ccgT0JE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7736

T24gMTEvMTAvMjAyNCAxMTozOSwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBMZXdpcyBoYXNuJ3Qg
d29ya2VkIGF0IE1pY3JvY2hpcCBmb3IgYSB3aGlsZSwgYW5kIElJUkMgbmV2ZXIgYWN0dWFsbHkN
Cj4gd29ya2VkIG9uIHRoZSBSVEMgaW4gdGhlIGZpcnN0IHBsYWNlLiBSZW1vdmUgaGltIGZyb20g
dGhlIG1haW50YWluZXJzDQo+IGxpc3QgaW4gdGhlIGJpbmRpbmcsIGxlYXZpbmcgRGFpcmUuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPg0KPiAtLS0NCj4gTm90aWNlZCBoaW0gaW4gdGhlIENDIGxpc3Qgb2YgeW91ciByZW5hbWUs
IGZpZ3VyZWQgaXQgd2FzIHdvcnRoIHJlbW92aW5nDQo+IGhpbSwgZXZlbiB0aG91Z2ggSSBkb24n
dCAvdGhpbmsvIG91ciBtYWlsIHN5c3RlbSB3aWxsIGNyZWF0ZSBib3VuY2Ugc3BhbQ0KPiBpbiB0
aGlzIGNhc2UuDQoNCkkgd2FzIHdyb25nLCBpdCBkb2VzIGdlbmVyYXRlIGJvdW5jZSBzcGFtIDov
DQoNCg==

