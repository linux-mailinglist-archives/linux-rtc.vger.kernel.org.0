Return-Path: <linux-rtc+bounces-2501-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2679C4214
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 16:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F162B26617
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 15:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C97A19E98D;
	Mon, 11 Nov 2024 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="nOAlWh9l"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2107.outbound.protection.outlook.com [40.107.22.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DED80034;
	Mon, 11 Nov 2024 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731339737; cv=fail; b=chmlKz2VGBw1bY92w800K7F9JfZzvmeef62+enbcaFLtoK4Ai/RJDcxlnClNMyM3PTqISTCBGcUj3MAt8tZmhwVlHg3IxUSiSo2Pte6H0oQ7QNZORY6NquMbs+L0JWmE2lqqoju5Mf/6Je3pPYV1vGMEAayXmFg1Gu4/vCrBtb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731339737; c=relaxed/simple;
	bh=u5RfZhpATt05kNjup6Q2x6VVg3ghmBisxyPaHB2RssY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gC2ROO+6q6tL1W9s21rMSDheXHWe6V3PluQ42DCZaAIbOnQX0O0NlynCaWN3n5esfNhnbYmkgKrwuKnauumSakW9aX8SjKCGPCV8vZKrFmKDx3KdOiugXMkmlSTlDDJhOgF9hZRzvfCvfuCVKhjFfdUvcGkW618tAi3mNiSnRZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=nOAlWh9l; arc=fail smtp.client-ip=40.107.22.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4ig0ae1bGmd9fPbjxIic9o/HJZoXWoCqJxH+HDL3oXsnBqc7dUzp15HG0Ia4KqEPwkWqNwQDGdVSNop91AAdI5eiNkZrTR/KVvF3GpcyD92y5IGro4CUN8YQe740ZuycA/rUGEhE8F9LhDcgRMhKLsO2alzVwEJqhpH/hinywy2SJODKFxlYnynREfyvxTgC5WGLAxf08dhwK5EbH6PlkFENu+x1wT0zArvXCaF+fKaP0uQjtuIJNTkJGbhuYUALT6ppujWv2/O7abPhYZ0wRXqwF/piYrqSKB4ihx0IbiekUX5QlkTY+OoAwcNCPUfn9iMf2qlrONdVbo5r+0R1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/DhLe88Z/Zo3m/X04Ak7aJ6cyPwoJwQykqLASFwZjc=;
 b=d6oApP1waC516guz1PMjMMLlATG5HHm3aQeaPxxN1K4D8T9yMA7JN5vOxUr172K8cJcXWvSldII8qJfZU8rs/lZD9RF3uABPkghouDXX2kbFo6ws0mB4UFwrIfEA/nwITXiyoR35zxrIOw7TUFrQbFYvBQQgXpKvsuvdJZoxDbeYiRoX/GZGGXT0Javuz5yR4oepTr//VWogf4M5bJKtEgYhi6gorITMLH1QATSMPXOy9+9f/aC+6peg5olXULOhcsGl3xTwVNctZR8o0SNDu9qLbgcLS4kwKfZ1qoRFU+LIHlfnXAJhLfo9xXW3mVtfdXzubWcliSR75gWX3WhIfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/DhLe88Z/Zo3m/X04Ak7aJ6cyPwoJwQykqLASFwZjc=;
 b=nOAlWh9lxeqan3qQLN0z7FdAInk0fTetd/R7DCvsCCpAd+sD1AeimDogEhfUs2jFLXexat9rx21uLtsw+7TKNAGU++6/MZ4jw6Ywupsh4cW6U+LVG4LPB4yoO9+I0APmdpp19Cl+zQ8uuDHggLU+rFBv6DJnxPR0zKB7yEK9O5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:160::8)
 by DU2P193MB2001.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 15:42:10 +0000
Received: from AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90]) by AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 ([fe80::2398:d74:da85:f90%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 15:42:10 +0000
From: Philipp Rosenberger <p.rosenberger@kunbus.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	=?UTF-8?q?Thomas=20B=C3=B6hler?= <t.boehler@kunbus.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Philipp Rosenberger <p.rosenberger@kunbus.com>
Subject: [PATCH v3 0/2] rtc: pcf2127: make battery switch-over configurable
Date: Mon, 11 Nov 2024 16:41:42 +0100
Message-Id: <20241111154144.163604-1-p.rosenberger@kunbus.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:160::8)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0P193MB0738:EE_|DU2P193MB2001:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7948bd-dfc2-4334-d269-08dd026767e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Egefg0P94sOiu7zUKxkYeYkjiuVTBWB0mrDrMHpQc4dXHShDB8zuINF8BTmw?=
 =?us-ascii?Q?DI5w48cmPwEpc2HGEIaaTDHSbIjimUxsU2Zo++I3s32LQnwWIRzz9asSg6OR?=
 =?us-ascii?Q?PVEF0ALm+t5A3nMQOTlSCKLNdDO/u5/RAvOnK8RMeUXWTJGVn5RAT6JAg5JG?=
 =?us-ascii?Q?NkMb0LV5HqH1HYzNGq7OaIst1NdSaI/AwVtr+Q8s4hxzbbKMEeeh2eliEq0f?=
 =?us-ascii?Q?9ofOkDsynBLUZZ2X657RaFfQStCNuCP6pGPF0V3yn5of2eOZ7GiuGjjL+9eu?=
 =?us-ascii?Q?FwWqf6s46jimoqCDMsHJcKuoe44/n/quB9emlh6yRJeB7ObyMMwnci3QdTIo?=
 =?us-ascii?Q?UuyxS8rvg0VRj4A6HHbcl4g/afE4QzRhK8JC5gcwpDQVSEfXUg40CzQi7vJs?=
 =?us-ascii?Q?dL9LLcfL0HhxLYqlFR3xiWQTPCUbe4wmol4fgqh0xr/qEYmQNXrCwMbUIxHK?=
 =?us-ascii?Q?TaUiRqguyGmB3AlB5okCwclJtq8nNd2MzPBysM8SHHzC75WX/35bE6jH6ETX?=
 =?us-ascii?Q?MVvNEdxQEu2IBpNkgd0WcAl4+DYS0OmvnxcPhx+Tz1oE+UAeuWt1cNdHH4N9?=
 =?us-ascii?Q?qPk+NiZdfQ+C9LC47mE5YNScVIrlBUS6xzCD5X5gvzqFgFDpXmEILjfMP61H?=
 =?us-ascii?Q?n0UypfK+da3KKH+qFf3xaQdA5irvUf8aLNMaX7TRcDv395rAhaU45UNNo7Px?=
 =?us-ascii?Q?HPV+VpAl1bHIZa8HwmMidN1c65oxUAWahUUVmgO1f/MI4dF7vCwj05q/fsbZ?=
 =?us-ascii?Q?LHlfSwfO2Tp+voMAxKoBb/r/9cB9NQlXuq9DnN9bDOjb5eR0EnTKvVgPWLuf?=
 =?us-ascii?Q?7BgjhVSYw62Uh0fJ88kkrJlPB06g7n7n+CMP800mKDMbBmy5pXVBpGgTsmdd?=
 =?us-ascii?Q?InWQ9FDW6w1Rgq+GFcCujlUh6V2gZ/T74DMVtTTvoXDxMqdf/rNNFDG8Fwpi?=
 =?us-ascii?Q?q9qPlKOQPZnXOODKgvh2TGSTFFIxT+JIKgH8jYTiCug2C/yqj2sUJdQKaJ7R?=
 =?us-ascii?Q?9Lt5TR/kVXNefXKjC0pidIaXpW4et2K/y3ZyPRtpfRtMflr6vNMoqhek12en?=
 =?us-ascii?Q?9eRZMSChWZJCzMi03qX60Sor6N2AN5+ZRDBizRt0gUC8UrOq1SgxUPMNrN5i?=
 =?us-ascii?Q?seUNOe4GMfgMXUEBxvXJy4AkegwC35qZiL3UWCRK35x+DfYuMgmP/SZv3+eK?=
 =?us-ascii?Q?cyShLs1rrAUlDvzQ2HrnCayUsXtUMJKU3E9uI9nfLe79vntQomnmjOyKYFdK?=
 =?us-ascii?Q?kwi0dkkV8rL9JdZJ51QKCrMh3jRPByoSi1LeGnDh78u2m0eub9YsyD+wxD+C?=
 =?us-ascii?Q?lVpcrI+BHFYYQTXCUkJ+4vJ5L1UxZhZmSyKhplhHG+QHfV4vYgs5yvepSBXm?=
 =?us-ascii?Q?mPa0aLY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P193MB0738.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z668g7tkJqiBbDS5WYd6vK2Q4bfzBvqVQBKa9Nchdz99sjdYoV02+i87N5EF?=
 =?us-ascii?Q?2VZzDDMpUATFMjh+M6YCyxeQVE3wuUG3Ib5VDrjzsm1Y8DTL0pygiq61LMeM?=
 =?us-ascii?Q?CO7plWDyH05eijMOdIWVXL4y3jlmk4YrIVTRdYOuXqyjNuL3RBWcDFv1pg9G?=
 =?us-ascii?Q?hirmkYs65UsFcS3y66wme0hVgasDHvRYtA2BPviyG73Tkxg7now86E9PqcGG?=
 =?us-ascii?Q?hEIAd+KjD4XzcRy8dPpqsP/O3kdLPU1enec18MpfjVK9f1LEFfWsO4f4xHvC?=
 =?us-ascii?Q?OJPMnsJQPlOTEOZpg7DhEfboeQ5iIR9tljO7tcYzaZnYPG5C+025zU1Rk6F3?=
 =?us-ascii?Q?lamyz5RMNnn0lhe4D80bbByEuD3uF48sLxAsuoYhddWWDhedD1kvWQ2VWOTg?=
 =?us-ascii?Q?ec/cxem32R9/mpGlOlVpNX/Yjs3QIi3CVA8d88XWfTMZCWuGjuk94Lopq9ei?=
 =?us-ascii?Q?gYyRoBc8wZ4HVwXMBb7FtoiKp74Ey7SJtmCgrX3fdYlgzpt1FsZAFtkhJF6g?=
 =?us-ascii?Q?+JB2ZBwW+HYoKbTuUG0nlwtqgk35mKZDADxUzjE1YGfDn2IcomgSqMQNYXIu?=
 =?us-ascii?Q?fxr1rbJ+B5i6IRcXtGlmXLKhrTvpyZKLlq/Fb/F+Y8/N0tU/RpMos8xbt5yC?=
 =?us-ascii?Q?tbPUP7h+aDw5eh/5lGHSJvvyqU3NxUFb2rUhjwKOXKbnB+8ocwbvI88Zy0gk?=
 =?us-ascii?Q?HPrFme9u4ZfMw+KuTNEBhdbYqkVX4yLGYkvAgmYgIfVZ/VWTkWXtaJJYaF+2?=
 =?us-ascii?Q?8uMhujrsEoEMJORV4AWRe13zrSb+a4tTXvPFAUgP1+gbg46OjfYMdN1PnYY1?=
 =?us-ascii?Q?A9JHy8I2rwtu7FCJGmnVozyW7Ti4vFD3ffWIZMcnjfgXL8wyoGB2Cqi84bCg?=
 =?us-ascii?Q?S+ZYO3/fV9mWKuJq0raqD7zkjqi1sNywonhzjBVED11hoNo2+P7X40cr9Jjt?=
 =?us-ascii?Q?SsHXExL1YPr8/iXaO9UapxsmfXvpXPS1rboUMnlEPGnzUjVKL1+Bnwk8vN8X?=
 =?us-ascii?Q?+zxS2j2xQo88QC1MPamMB9/fZV40U3XUlTdTySoOx4UxNwvaBxgxffWKurMm?=
 =?us-ascii?Q?Z/vJ8M8xkxltNBtyfqyrcfPdvLiwLwoFPqIHyKbYS914eT1Dr5+Hq9ovhF4K?=
 =?us-ascii?Q?AsJ3m8o1Z/eskphl97nPPHTn5pHAVzhl5u1Ous2SC2qODsUKjkCRe+1xtkjZ?=
 =?us-ascii?Q?jvCQNlsUzw+33YvoU326z4AksLDOXUtFh7oBppTSKWUxjrHK8LE+pnwKLBRY?=
 =?us-ascii?Q?lt+8BxxzYEy254CJG/b9xZS3HmkXVBII3sgjlJmIl9iUAHrvmQjvCorVFyti?=
 =?us-ascii?Q?ttIOOqwJ38yp+big2veKBA4623YOVWHAfXwbXjDn9Zko+lzd/exS6nUSb+zw?=
 =?us-ascii?Q?lUd3vM+NSE9wj55nQRjcWUVURzX0KDr1apT8KX+GJ31U3SrG3RwcL6vGZOr1?=
 =?us-ascii?Q?8pbtsEc6Sw9OfotcTJ+N0LUlQgmzkL0qS/kJW9AzzFw1WksssJ+YbyqWEROr?=
 =?us-ascii?Q?ldk/q+MSKgHISvAisdj0dcVjjgPK3HvUCPecod6JFQLr/eYea69OZJ/Xk3Km?=
 =?us-ascii?Q?VQZH0QKotSp8/2/KXV1xmxpki44rS2WBaaFmBTxGa6QLfIuPjDiCyGAgJJ8D?=
 =?us-ascii?Q?eg=3D=3D?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7948bd-dfc2-4334-d269-08dd026767e9
X-MS-Exchange-CrossTenant-AuthSource: AM0P193MB0738.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 15:42:10.6686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gL1m0RHkjlu5fm6yzmfOCFRyfn44kF10qr786Z2EkqoQOjRKVKY7apDaOrxRxZ21EkIQnw1bEt04gZEMm2MzgJnkkWXvfAanaObD+hmD3DE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P193MB2001

Hello,

This patch series adds the nxp,battery-backed device tree property to the
PCF2127 RTC driver. This flag indicates if the RTC is battery-backed, allowing
the driver to enable the battery switchover function if necessary.

Background
----------
The PCF2127 RTC driver currently supports the PCF2127, PCA2129, PCF2129, and
PCF2131 devices. Among these, only the newer PCF2131 has a different default
behavior for battery switchover: it is disabled by default, whereas it is
enabled on the other devices. If there is no firmware or bootloader setting
to enable battery switchover on the PCF2131, it will not automatically switch
to battery power, even if a battery is attached.

An alternative approach would be to enable battery switchover by default on
the PCF2131 without requiring a device tree property. However, this could be
undesirable, as it would make it impossible to disable battery
switchover.

Thank you.

Link [V2] https://patchwork.ozlabs.org/project/rtc-linux/list/?series=429144

Changes for V3:
- The nxp,battery-switch-over property was replaced with a boolean
  nxp,battery-backed flag
- The register vales are not encoded in the device tree any more
- The driver enables battery switch-over in standard mode if the dt flag
  is set.

Changes for V2:
- v1 was corrupted due to our company mail server settings. No functional
  changes have been made; this version is identical to v1.

Philipp Rosenberger (2):
  dt-bindings: rtc: pcf2127: Add nxp,battery-backed flag
  rtc: pcf2127: Add 'nxp,battery-switchover' DT property to enable
    battery switch-over

 .../devicetree/bindings/rtc/nxp,pcf2127.yaml  |  7 ++
 drivers/rtc/rtc-pcf2127.c                     | 76 +++++++++++++++----
 2 files changed, 68 insertions(+), 15 deletions(-)

-- 
2.39.5


