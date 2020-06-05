Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9811F02F0
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Jun 2020 00:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbgFEWfm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 Jun 2020 18:35:42 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:60101 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728013AbgFEWfm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 Jun 2020 18:35:42 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 900BE20003;
        Fri,  5 Jun 2020 22:35:40 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        bth@kamstrup.com, martin@geanix.com
Subject: Re: [PATCH] rtc: pcf2127: watchdog: handle nowayout feature
Date:   Sat,  6 Jun 2020 00:35:40 +0200
Message-Id: <159139649568.1283721.4056258986130707462.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604162602.76524-1-bruno.thomsen@gmail.com>
References: <20200604162602.76524-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 4 Jun 2020 18:26:02 +0200, Bruno Thomsen wrote:
> Driver does not use module parameter for nowayout, so it need to
> statically initialize status variable of the watchdog_device based
> on CONFIG_WATCHDOG_NOWAYOUT.

Applied, thanks!

[1/1] rtc: pcf2127: watchdog: handle nowayout feature
      commit: 4601e24a6fb819d38d1156d0f690cbe6a42c6d76

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
