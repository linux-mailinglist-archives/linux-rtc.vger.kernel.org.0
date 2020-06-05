Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA6C1F02EE
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Jun 2020 00:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgFEWem (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 Jun 2020 18:34:42 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:37487 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbgFEWem (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 Jun 2020 18:34:42 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 57032C0005;
        Fri,  5 Jun 2020 22:34:40 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ran Wang <ran.wang_1@nxp.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Li Biwen <biwen.li@nxp.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: fsl-ftm-alarm: fix freeze(s2idle) failed to wake
Date:   Sat,  6 Jun 2020 00:34:39 +0200
Message-Id: <159139631141.1283058.13634639619999144378.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200601071914.36444-1-ran.wang_1@nxp.com>
References: <20200601071914.36444-1-ran.wang_1@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 1 Jun 2020 15:19:14 +0800, Ran Wang wrote:
> Use dev_pm_set_wake_irq() instead of flag IRQF_NO_SUSPEND to enable
> wakeup system feature for both freeze(s2idle) and mem(deep).

Applied, thanks!

[1/1] rtc: fsl-ftm-alarm: fix freeze(s2idle) failed to wake
      commit: 3a8ce46ce15accad53b39837735c12d886964211

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
