Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB0D3C2C39
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Jul 2021 02:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhGJBB5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jul 2021 21:01:57 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:59377 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhGJBB5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jul 2021 21:01:57 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id F11DAE0005;
        Sat, 10 Jul 2021 00:59:11 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mian Yousaf Kaukab <ykaukab@suse.de>, bruno.thomsen@gmail.com,
        a.zummo@towertech.it
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, biwen.li@nxp.com,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v6] rtc: pcf2127: handle timestamp interrupts
Date:   Sat, 10 Jul 2021 02:59:11 +0200
Message-Id: <162587872813.1211209.2142663515457397742.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629150643.31551-1-ykaukab@suse.de>
References: <20210629150643.31551-1-ykaukab@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 29 Jun 2021 17:06:43 +0200, Mian Yousaf Kaukab wrote:
> commit 03623b4b041c ("rtc: pcf2127: add tamper detection support")
> added support for timestamp interrupts. However they are not being
> handled in the irq handler. If a timestamp interrupt occurs it
> results in kernel disabling the interrupt and displaying the call
> trace:
> 
> [  121.145580] irq 78: nobody cared (try booting with the "irqpoll" option)
> ...
> [  121.238087] [<00000000c4d69393>] irq_default_primary_handler threaded [<000000000a90d25b>] pcf2127_rtc_irq [rtc_pcf2127]
> [  121.248971] Disabling IRQ #78
> 
> [...]

Applied, thanks!

[1/1] rtc: pcf2127: handle timestamp interrupts
      commit: 2f8619846755176a6720c71d580ffd09394a74bc

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
