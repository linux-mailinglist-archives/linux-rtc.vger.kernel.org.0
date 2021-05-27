Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF41E3930CB
	for <lists+linux-rtc@lfdr.de>; Thu, 27 May 2021 16:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236498AbhE0OZQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 May 2021 10:25:16 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:56418 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236501AbhE0OZP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 27 May 2021 10:25:15 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B1D9D2190B;
        Thu, 27 May 2021 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622125421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d8wgJqVTv1rNHg3817XcovAxG94o5OyrEsk/WWRy4VI=;
        b=mj7GeSn2/5JwetOeT+5iWIbnhCw6Dpe47cPvPGa4282dm21UZ42LWGWrtFBYFmMl6AqQIa
        BKdmyoEupm+kyLsBUGZp+n3y5hTiuOx7CoN8kUYZF8ZmXlO0nk0fRwj7Hry2iQJYWx1qMU
        DdPnT3+CGJmdjNsfuG0rAwysnqUvFiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622125421;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d8wgJqVTv1rNHg3817XcovAxG94o5OyrEsk/WWRy4VI=;
        b=vKXMzGOb1AiaPsu8a3S5oc8imG1I+MV1+cxAnW8JEhs2b9gBma2bkXKsZ31bYEelOFSKKa
        X5Aisd/jAxZ2HZAQ==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
        by imap.suse.de (Postfix) with ESMTPSA id 77A4111A98;
        Thu, 27 May 2021 14:23:41 +0000 (UTC)
Date:   Thu, 27 May 2021 16:23:36 +0200
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        biwen.li@nxp.com
Subject: Re: [PATCH v4] rtc: pcf2127: handle timestamp interrupts
Message-ID: <20210527142306.GA103044@suse.de>
References: <20210525101107.9605-1-ykaukab@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210525101107.9605-1-ykaukab@suse.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, May 25, 2021 at 12:11:07PM +0200, Mian Yousaf Kaukab wrote:
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
> Handle timestamp interrupts in pcf2127_rtc_irq(). Save time stamp
> before clearing TSF1 and TSF2 flags so that it can't be overwritten.
> Set a flag to mark if the timestamp is valid and only report to sysfs
> if the flag is set. To mimic the hardware behavior, don’t save
> another timestamp until the first one has been read by the userspace.
Alexandre, I hope this patch addresses all your concerns. Please let
me know if thats not the case.

BR,
Yousaf
