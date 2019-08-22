Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2A69A1C1
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 23:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732068AbfHVVLv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 17:11:51 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:47667 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730991AbfHVVLv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 17:11:51 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3AB5D240007;
        Thu, 22 Aug 2019 21:11:48 +0000 (UTC)
Date:   Thu, 22 Aug 2019 23:11:47 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Kevin Hilman <khilman@kernel.org>
Cc:     linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rtc: Add Amlogic Virtual Wake RTC
Message-ID: <20190822211147.GB27031@piout.net>
References: <20190812232850.8016-1-khilman@kernel.org>
 <20190812232850.8016-3-khilman@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812232850.8016-3-khilman@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/08/2019 16:28:50-0700, Kevin Hilman wrote:
> From: Neil Armstrong <narmstrong@baylibre.com>
> 
> The Amlogic Meson GX SoCs uses a special register to store the
> time in seconds to wakeup after a system suspend.
> 
> In order to be able to reuse the RTC wakealarm feature, this
> driver implements a fake RTC device which uses the system time
> to deduce a suspend delay.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> [khilman: rebase to v5.3-rc, rework and modernization]
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/rtc/Kconfig          |  11 +++
>  drivers/rtc/Makefile         |   1 +
>  drivers/rtc/rtc-meson-vrtc.c | 156 +++++++++++++++++++++++++++++++++++
>  4 files changed, 169 insertions(+)
>  create mode 100644 drivers/rtc/rtc-meson-vrtc.c
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
