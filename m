Return-Path: <linux-rtc+bounces-1474-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B84D392E90D
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 15:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37ABC1F238A6
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2024 13:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A1815E5C8;
	Thu, 11 Jul 2024 13:16:14 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CF914A601;
	Thu, 11 Jul 2024 13:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720703774; cv=none; b=t5yxJF7lw351X9dSoQATqVojP7i6gQiSkurmoyQlYUwulfA172VqLeaMX8vf2JWsbv0p4AUlLKUK8gePfsgqfLgvP3rYk8zfg3U/AFY7hhkbCmnbGAdDwAQCLCf1sbGhlyumtBrrshBOn493euZa8CK5hZY2yT5PTSQOdC93JNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720703774; c=relaxed/simple;
	bh=ZhZuMuRHnJIyr1f7YUiPJaPnBXIKeUBQIvzGT9F7HGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvOqFF+AC3Mf/qJ/e8nayrMUMUdMcRMmeU2TNniDTTT0QUC7AsLImXcnzO3J1kpLV+XWUue8iQ9CbcSWy7TfoHvrMKgKx19f3hpuL1LrM03+zbQzZml49N+P7TTIWUV3FODKt557rjSdKhndfwLH5BN3ai/lkMbrthkNE4mA5oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A703BFEC;
	Thu, 11 Jul 2024 06:16:36 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78F383F766;
	Thu, 11 Jul 2024 06:16:08 -0700 (PDT)
Date: Thu, 11 Jul 2024 14:16:06 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 1/7] Documentation: firmware-guide: add NXP i.MX95
 SCMI documentation
Message-ID: <Zo_bFnjWixZF6seV@pluto>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
 <20240621-imx95-bbm-misc-v2-v5-1-b85a6bf778cb@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-imx95-bbm-misc-v2-v5-1-b85a6bf778cb@nxp.com>

On Fri, Jun 21, 2024 at 03:04:36PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add NXP i.MX95 System Control Management Interface(SCMI) vendor
> extensions protocol documentation.
> 

Hi,

beside the final location of this file in the tree, and a few nitpicks
down below.

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

[snip]

> +MISC_CONTROL_GET
> +~~~~~~~~~~~~~~~~
> +
> +message_id: 0x4
> +protocol_id: 0x84
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 index      |Index of the control                                       |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the control was get successfully.              |
> +|                  |NOT_FOUND: if the index is not valid.                      |
> +|                  |DENIED: if the agent does not have permission to get the   |
> +|                  |control                                                    |
> ++------------------+-----------------------------------------------------------+
> +|uint32 num        |Size of the return data in words, max 8                    |
> ++------------------+-----------------------------------------------------------+
> +|uint32            |                                                           |
> +|val[0, num - 8]   |value data array                                           |

    val[0, num - 1]   --- typo ?

which I suppose means that this  field is variable in size depending on
num value...

In the gneral SCMI spec I think usually we write something like

   uint32 val[N] with N as specified in num.

... but I am fine even with this val[0, num - 1] if it is intended to
meanb this same thing, i.e. variable size field depending on another
field.

> ++------------------+-----------------------------------------------------------+
> +
> +MISC_CONTROL_ACTION
> +~~~~~~~~~~~~~~~~~~~
> +
> +message_id: 0x5
> +protocol_id: 0x84
> +
> ++------------------+-----------------------------------------------------------+
> +|Parameters                                                                    |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|uint32 index      |Index of the control                                       |
> ++------------------+-----------------------------------------------------------+
> +|uint32 action	   |Action for the control                                     |
> ++------------------+-----------------------------------------------------------+
> +|uint32 numarg	   |Size of the argument data, max 8                           |
> ++------------------+-----------------------------------------------------------+
> +|uint32            |                                                           |
> +|arg[0, numarg -1] |Argument data array                                        |
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the action was set successfully.               |
> +|                  |NOT_FOUND: if the index is not valid.                      |
> +|                  |DENIED: if the agent does not have permission to get the   |
> +|                  |control                                                    |
> ++------------------+-----------------------------------------------------------+
> +|uint32 num        |Size of the return data in words, max 8                    |
> ++------------------+-----------------------------------------------------------+
> +|uint32            |                                                           |
> +|val[0:num-1]      |value data array                                           |

    val[0, num - 1] ... for consistency

> ++------------------+-----------------------------------------------------------+
> +
> +MISC_DISCOVER_BUILD_INFO
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +This function is used to obtain the build commit, data, time, number.
> +
> +message_id: 0x6
> +protocol_id: 0x84
> +
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the build info was got successfully.           |
> +|                  |NOT_SUPPORTED: if the data is not available.               |
> ++------------------+-----------------------------------------------------------+
> +|uint32 buildnum   |Build number                                               |
> ++------------------+-----------------------------------------------------------+
> +|uint32 buildcommit|Most significant 32 bits of the git commit hash            |
> ++------------------+-----------------------------------------------------------+
> +|uint8 date[16]    |Date of build. Null terminated ASCII string of up to 16    |
> +|                  |bytes in length                                            |
> ++------------------+-----------------------------------------------------------+
> +|uint8 time[16]    |Time of build. Null terminated ASCII string of up to 16    |
> +|                  |bytes in length                                            |
> ++------------------+-----------------------------------------------------------+
> +
> +MISC_ROM_PASSOVER_GET
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +ROM passover data is information exported by ROM and could be used by others.
> +It includes boot device, instance, type, mode and etc. This function is used
> +to obtain the ROM passover data. The returned block of words is structured as
> +defined in the ROM passover section in the SoC RM.
> +
> +message_id: 0x7
> +protocol_id: 0x84
> +
> ++------------------+-----------------------------------------------------------+
> +|Return values                                                                 |
> ++------------------+-----------------------------------------------------------+
> +|Name              |Description                                                |
> ++------------------+-----------------------------------------------------------+
> +|int32 status      |SUCCESS: if the data was got successfully.                 |
> +|                  |NOT_SUPPORTED: if the data is not available.               |
> ++------------------+-----------------------------------------------------------+
> +|uint32 num        |Size of the passover data in words, max 13                 |
> ++------------------+-----------------------------------------------------------+
> +|uint32_t          |                                                           |
> +|data[0:num-1]     |Passover data array                                        |
> ++------------------+-----------------------------------------------------------+
> +

   data[0, num - 1] ...  consistency

Thanks,
Cristian


