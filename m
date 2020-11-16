Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28752B4D55
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Nov 2020 18:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732968AbgKPRgV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Nov 2020 12:36:21 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:37031 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731590AbgKPRgU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Nov 2020 12:36:20 -0500
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9B3BF100043;
        Mon, 16 Nov 2020 17:36:18 +0000 (UTC)
Date:   Mon, 16 Nov 2020 18:36:17 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Claudius Heine <ch@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>
Subject: Re: [PATCH v2 1/3] rtc: rx6110: add i2c support
Message-ID: <20201116173617.GV4556@piout.net>
References: <20201112130734.331094-1-ch@denx.de>
 <20201112130734.331094-2-ch@denx.de>
 <20201116144343.GA1689012@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116144343.GA1689012@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/11/2020 16:43:43+0200, Andy Shevchenko wrote:
> On Thu, Nov 12, 2020 at 02:07:32PM +0100, Claudius Heine wrote:
> > The RX6110 also supports I2C, so this patch adds support for it to the
> > driver.
> > 
> > This also renames the SPI specific functions and variables to include
> > `_spi_` in their names.
> 
> As practice shows this is not the best approach. Can you ratqer split it to
> three modules: core, spi, i2c like it's done in many other cases (esp. IIO)?
> 

Actually, I'm fine with having everytihn in the same file because
separating everything out means having 3 more files per rtc supporting
both busses in an already very crowded folder. And I don't think being
able to remove support for one or the other holds any actual value.

> In Kconfig you just leave same option with two additional ones like
> 
> config ..._SPI
> 	tristate
> 	default SPI_MASTER
> 	depends on SPI_MASTER
> 
> config ..._I2C
> 	tristate
> 	default I2C
> 	depends on I2C
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
