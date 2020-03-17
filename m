Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83195188515
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2020 14:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgCQNPK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Mar 2020 09:15:10 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:38307 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbgCQNPK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Mar 2020 09:15:10 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0231E10001E;
        Tue, 17 Mar 2020 13:14:46 +0000 (UTC)
Date:   Tue, 17 Mar 2020 14:14:45 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] rtc: mt2712: fix build without PM_SLEEP
Message-ID: <20200317131445.GC3448@piout.net>
References: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
 <CAMuHMdVy6J1G5P6BQ14D65=pRu-q=+kcN3RV8mjtaZcwBooZyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVy6J1G5P6BQ14D65=pRu-q=+kcN3RV8mjtaZcwBooZyw@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 17/03/2020 13:30:10+0100, Geert Uytterhoeven wrote:
> >  static SIMPLE_DEV_PM_OPS(mt2712_pm_ops, mt2712_rtc_suspend,
> >                          mt2712_rtc_resume);
> 
> That's 23 more unused pointers in your kernel image.
> 

This is true but, of the about 900 drivers setting pm callbacks, there
are only 39 doing that conditionally depending on CONFIG_PM or
CONFIG_PM_SLEEP. Interestingly, 9 of them are mediatek related.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
