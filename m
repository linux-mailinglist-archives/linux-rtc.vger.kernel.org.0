Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F61723C20D
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Aug 2020 01:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgHDXHb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Aug 2020 19:07:31 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:54507 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgHDXHb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Aug 2020 19:07:31 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 69CFAE0003;
        Tue,  4 Aug 2020 23:07:27 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it, linux@roeck-us.net,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3] rtc: ds1307: provide an indication that the watchdog has fired
Date:   Wed,  5 Aug 2020 01:07:27 +0200
Message-Id: <159658242980.19041.17408394582474699284.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200727034615.19755-1-chris.packham@alliedtelesis.co.nz>
References: <20200727034615.19755-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 27 Jul 2020 15:46:14 +1200, Chris Packham wrote:
> There's not much feedback when the ds1388 watchdog fires. Generally it
> yanks on the reset line and the board reboots. Capture the fact that the
> watchdog has fired in the past so that userspace can retrieve it via
> WDIOC_GETBOOTSTATUS. This should help distinguish a watchdog triggered
> reset from a power interruption.

Applied, thanks!

[1/1] rtc: ds1307: provide an indication that the watchdog has fired
      commit: 9bf1306257589b3a5ad46175538af9922d94e26f

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
