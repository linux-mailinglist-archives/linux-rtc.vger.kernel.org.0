Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309CB2B3131
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Nov 2020 23:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgKNWhZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Nov 2020 17:37:25 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49893 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgKNWhZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Nov 2020 17:37:25 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1390360002;
        Sat, 14 Nov 2020 22:37:22 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Heiko Stuebner <heiko@sntech.de>,
        Guillaume Tucker <guillaume.tucker@collabora.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: hym8563: enable wakeup when applicable
Date:   Sat, 14 Nov 2020 23:37:21 +0100
Message-Id: <160539337060.848153.7453047020568943030.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1ea023e2ba50a4dab6e39be93d7de3146af71a60.1604653374.git.guillaume.tucker@collabora.com>
References: <1ea023e2ba50a4dab6e39be93d7de3146af71a60.1604653374.git.guillaume.tucker@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 6 Nov 2020 09:06:31 +0000, Guillaume Tucker wrote:
> Enable wakeup in the hym8563 driver if the IRQ was successfully
> requested or if wakeup-source is set in the devicetree.
> 
> As per the description of device_init_wakeup(), it should be enabled
> for "devices that everyone expects to be wakeup sources".  One would
> expect this to be the case with a real-time clock.
> 
> [...]

Applied, thanks!

[1/1] rtc: hym8563: enable wakeup when applicable
      commit: c56ac7a0f468ceb38d24db41f4446d98ab94da2d

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
