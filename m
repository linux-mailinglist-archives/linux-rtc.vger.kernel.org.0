Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 155EC42FBC5
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 21:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242600AbhJOTOf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 15:14:35 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:56391 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242589AbhJOTOe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 15:14:34 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EEAC51BF208;
        Fri, 15 Oct 2021 19:12:25 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        a.zummo@towertech.it
Subject: Re: [PATCH] rtc: class: don't call cdev_device_del() when cdev_device_add() failed
Date:   Fri, 15 Oct 2021 21:12:21 +0200
Message-Id: <163432513381.815620.221714122932676041.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211011132114.3663509-1-yangyingliang@huawei.com>
References: <20211011132114.3663509-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 11 Oct 2021 21:21:14 +0800, Yang Yingliang wrote:
> I got a null-ptr-deref report when doing fault injection test:
> 
> general protection fault, probably for non-canonical address 0xdffffc0000000022: 0000 [#1] SMP KASAN PTI
> KASAN: null-ptr-deref in range [0x0000000000000110-0x0000000000000117]
> RIP: 0010:device_del+0x132/0xdc0
> Call Trace:
>  cdev_device_del+0x1a/0x80
>  devm_rtc_unregister_device+0x37/0x80
>  release_nodes+0xc3/0x3b0
> 
> [...]

Applied, thanks!

[1/1] rtc: class: don't call cdev_device_del() when cdev_device_add() failed
      commit: 789c1093f02c436b320d78a739f9610c8271cb73

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
