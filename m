Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E00610D4BE
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2019 12:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfK2LZK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Nov 2019 06:25:10 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:32844 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726709AbfK2LZK (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 29 Nov 2019 06:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fizHtIIfo+LXed1ea7JppR2ohUiHGMK8GYqAyPbNTGE=; b=mPO60xS8atg9PK/5pqXMTDlL1Z
        5Dhc3i72WSnVhyMMl3fojnKxYecXqs9seRXCQc2xa3uwBRclnToefFK4xE4FhAvbw1D7RAgJFlGe2
        u6icXESSl9tGbFnVVWhVG9iViXEimwnY2cWuXRqXfrxNqIrwyCyK5qCvvBjo9HIw+LCY=;
Received: from [2a02:790:ff:919:7ee9:d3ff:fe1f:a246] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iaeOX-0004qH-Jd; Fri, 29 Nov 2019 12:25:06 +0100
Received: from [::1] (helo=localhost)
        by localhost with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iaeOU-0001VL-FM; Fri, 29 Nov 2019 12:25:02 +0100
Date:   Fri, 29 Nov 2019 12:25:01 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     lee.jones@linaro.org, a.zummo@towertech.it,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        phh@phh.me, b.galvani@gmail.com, stefan@agner.ch,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH v2 5/5] rtc: rtc-rc5t619: add ricoh rc5t619 RTC driver
Message-ID: <20191129122501.6cecc7f2@kemnade.info>
In-Reply-To: <20191129085500.GV299836@piout.net>
References: <20191031213835.11390-1-andreas@kemnade.info>
        <20191031213835.11390-6-andreas@kemnade.info>
        <20191128105751.GM299836@piout.net>
        <20191129075940.3b1c2631@kemnade.info>
        <20191129085500.GV299836@piout.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 29 Nov 2019 09:55:00 +0100
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> On 29/11/2019 07:59:40+0100, Andreas Kemnade wrote:
> > > > +	/* disable interrupt */
> > > > +	err = rc5t619_rtc_alarm_enable(&pdev->dev, 0);
> > > > +	if (err)
> > > > +		return err;    
> > > 
> > > Is it really useful to disable the alarm to reenable them later?
> > >   
> > Well, yes, seems to be nonsense.
> > Am I right that I do not need to prevent alarm irqs between
> > alloc() and register()?
> >   
> 
> That's fine, the core will be ready to handle alarms after alloc()
> 
ok, will clean that up and probably produce a -v3 this evening.

Regards,
Andreas
