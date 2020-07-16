Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1066F222198
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jul 2020 13:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgGPLgX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Jul 2020 07:36:23 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:48173 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728126AbgGPLgW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Jul 2020 07:36:22 -0400
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id AB4D2100002;
        Thu, 16 Jul 2020 11:35:45 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>,
        linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        a.zummo@towertech.it
Subject: Re: [PATCH] rtc: cleanup obsolete comment about struct rtc_class_ops
Date:   Thu, 16 Jul 2020 13:35:43 +0200
Message-Id: <159489932613.22000.8004259769043986083.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710080003.7986-1-misono.tomohiro@jp.fujitsu.com>
References: <20200710080003.7986-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 10 Jul 2020 17:00:03 +0900, Misono Tomohiro wrote:
> Commit ea369ea6d828 ("rtc: remove .open() and .release()") removes
> open/release callback from struct rtc_class_ops.
> 
> Also commit 80d4bb515b78 ("RTC: Cleanup rtc_class_ops->irq_set_state")
> and commit 696160fec162 ("RTC: Cleanup rtc_class_ops->irq_set_freq()")
> removes irq callbacks.
> 
> [...]

Applied, thanks!

[1/1] rtc: cleanup obsolete comment about struct rtc_class_ops
      commit: a5e6f964bb2c613933de58a35ddfa306128ba004

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
