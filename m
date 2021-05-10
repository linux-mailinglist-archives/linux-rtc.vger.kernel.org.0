Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA2C379264
	for <lists+linux-rtc@lfdr.de>; Mon, 10 May 2021 17:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233262AbhEJPUN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Mon, 10 May 2021 11:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbhEJPSs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 10 May 2021 11:18:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DE4C08EAF0
        for <linux-rtc@vger.kernel.org>; Mon, 10 May 2021 07:47:20 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lg7Bb-0005Em-Ef; Mon, 10 May 2021 16:47:07 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lg7BZ-0001jS-In; Mon, 10 May 2021 16:47:05 +0200
Message-ID: <6dc43e369107d470d85dc541dc67432744bd4d01.camel@pengutronix.de>
Subject: Re: [PATCHv2 2/5] drm/imx: Add 8 pixel alignment fix
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Saravana Kannan <saravanak@google.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-mtd@lists.infradead.org,
        kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>
Date:   Mon, 10 May 2021 16:47:05 +0200
In-Reply-To: <20210428222953.235280-3-sebastian.reichel@collabora.com>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
         <20210428222953.235280-3-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Sebastian,

On Thu, 2021-04-29 at 00:29 +0200, Sebastian Reichel wrote:
> Some standard resolutions like 1366x768 do not work properly with
> i.MX6 SoCs, since the horizontal resolution needs to be aligned
> to 8 pixels (so 1360x768 or 1368x768 would work).
> 
> This patch allocates framebuffers allocated to 8 pixels. The extra
> time required to send the extra pixels are removed from the blank
> time. In order to expose the correct display size to userspace,
> the stride is increased without increasing the width.
> 
> Without this patch systems with this display resolution hang
> indefinitely during boot up.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thank you, I've rebased and applied this patch on top of imx-drm/next.

regards
Philipp
