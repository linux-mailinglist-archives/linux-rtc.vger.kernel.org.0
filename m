Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0BEA9A205
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 23:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390249AbfHVVPv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 17:15:51 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:51205 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390233AbfHVVPv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 17:15:51 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3128960002;
        Thu, 22 Aug 2019 21:15:48 +0000 (UTC)
Date:   Thu, 22 Aug 2019 23:15:47 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     megous@megous.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 1/3] dt-bindings: Add compatible for H6 RTC
Message-ID: <20190822211547.GE27031@piout.net>
References: <20190820151934.3860-1-megous@megous.com>
 <20190820151934.3860-2-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820151934.3860-2-megous@megous.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 20/08/2019 17:19:32+0200, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> RTC on H6 is similar to the one on H5 SoC, but incompatible in small
> details. See the driver for description of differences. For example
> H6 RTC needs to enable the external low speed oscillator. Add new
> compatible for this RTC.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
