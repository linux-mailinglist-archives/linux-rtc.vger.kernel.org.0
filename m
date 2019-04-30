Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 970D110018
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 21:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfD3TK2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 15:10:28 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:40807 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfD3TK2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 15:10:28 -0400
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 35361240007;
        Tue, 30 Apr 2019 19:10:21 +0000 (UTC)
Date:   Tue, 30 Apr 2019 21:10:21 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] rtc: digicolor: set range
Message-ID: <20190430191021.GH11339@piout.net>
References: <20190430093212.28425-1-alexandre.belloni@bootlin.com>
 <20190430093212.28425-2-alexandre.belloni@bootlin.com>
 <877ebbu3lz.fsf@tarshish>
 <20190430114702.GD11339@piout.net>
 <875zqvu1l3.fsf@tarshish>
 <20190430130544.GF11339@piout.net>
 <87y33rsef3.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y33rsef3.fsf@tarshish>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/04/2019 18:25:52+0300, Baruch Siach wrote:
> > Yes, this is ok to return a valid value that is higher than range_max.
> > However, at that time, you will not be able to set any alarms anymore as
> > the core doesn't allow to set alarms after range_max.
> >
> > I would think that this is fine because this will happen in 2106 and we
> > have a way to offset the time (the whole goal of setting the range)
> > using device tree.
> 
> That's the sort of documentation that I'm missing. The 'start-year'
> property is mentioned in the DT binding documentation. But I don't see
> where range_max is documented as a facility for the time offset feature.
> 

Sure, I'm planning to document better how a proper RTC driver should be
written. I needed to cleanup the digicolor driver because I4m removing
.set_mmss and .set_mmss64 this cycle.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
