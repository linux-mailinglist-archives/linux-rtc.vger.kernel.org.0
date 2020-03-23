Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C195C18F5F8
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Mar 2020 14:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgCWNni (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Mar 2020 09:43:38 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:40153 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728222AbgCWNnh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Mar 2020 09:43:37 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4FBDDC000F;
        Mon, 23 Mar 2020 13:43:35 +0000 (UTC)
Date:   Mon, 23 Mar 2020 14:43:35 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     xiaolinkui <xiaolinkui@tj.kylinos.cn>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: Kconfig: change the tristate type to bool
Message-ID: <20200323134335.GC5504@piout.net>
References: <20200323124339.6520-1-xiaolinkui@tj.kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323124339.6520-1-xiaolinkui@tj.kylinos.cn>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/03/2020 20:43:39+0800, xiaolinkui wrote:
> If the rtc driver is compiled into a module, hctosys can't
> read the rtc clock during system startup.
> The dmesg log will have the following information:
> 
> [    2.286512] hctosys: unable to open rtc device (rtc0)
> 
> So the rtc driver configuration we need cannot be set to m.
> 

Wow, you are not even trying, the solution is to not use hctosys.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
