Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8ADCF5EC
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2019 11:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730036AbfJHJYM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Oct 2019 05:24:12 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:55835 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730030AbfJHJYM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Oct 2019 05:24:12 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A4626C0010;
        Tue,  8 Oct 2019 09:24:09 +0000 (UTC)
Date:   Tue, 8 Oct 2019 11:24:09 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jinke Fan <fanjinke@hygon.cn>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        Wen Pu <puwen@hygon.cn>,
        "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
        "kim.phillips@amd.com" <kim.phillips@amd.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH RFC] rtc: Fix the AltCentury value on AMD/Hygon
 platform
Message-ID: <20191008092409.GR4254@piout.net>
References: <20190924024108.51286-1-fanjinke@hygon.cn>
 <20191003200127.GM575@piout.net>
 <dab321b4-c271-dc8e-65a5-63333aef837d@hygon.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dab321b4-c271-dc8e-65a5-63333aef837d@hygon.cn>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/10/2019 09:20:02+0000, Jinke Fan wrote:
> On 2019/10/4 4:01, Alexandre Belloni wrote:
> > On 24/09/2019 10:41:08+0800, Jinke Fan wrote:
> >> Signed-off-by: Jinke Fan <fanjinke@hygon.cn>
> >> ---
> >>   drivers/rtc/rtc-mc146818-lib.c | 9 +++++++--
> >>   include/linux/mc146818rtc.h    | 2 ++
> >>   2 files changed, 9 insertions(+), 2 deletions(-)
> >>
> > Applied, thanks.
> 
> Hi Alexandre,
> 
> Some compile errors on sparc64/alpha were reported by kbuild
> test robot<lkp@intel.com>. I wonder where could I get the applied
> branch, which need a fix patch.
> 

I removed it, fix the original patch.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
