Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B543B74B4
	for <lists+linux-rtc@lfdr.de>; Tue, 29 Jun 2021 16:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbhF2Oy4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 29 Jun 2021 10:54:56 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:41340 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbhF2Oyv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 29 Jun 2021 10:54:51 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 64F521FD84;
        Tue, 29 Jun 2021 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624978343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R6X/pQ7cKEtlsMwepYqULQ7e+u1sBHuvidfx8sln21w=;
        b=E4LG94XuwCv7baeSyslniUB/7fW7SZbECqHbWoD2UDiPXRgODLn54FymdoYPTrai4Zmjzh
        oxgf5tkCHLHZBcue8VPxNBGqqKbcp/ptZ2i2TnQI1FhgN/96x9+Z9MjKPHydwru57Ud9o2
        +gwD7C+WXn5Gn65kGEVJAP4nwgfUgCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624978343;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R6X/pQ7cKEtlsMwepYqULQ7e+u1sBHuvidfx8sln21w=;
        b=wPfu5FGWWN5hKwbY9JYRvwjK9UOU6iJrgw+11x1r2pMahHxulqJnuE1HRg4oT4K9FXAp+h
        mwRyGk5QikLQjWAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 2C07E11906;
        Tue, 29 Jun 2021 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624978343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R6X/pQ7cKEtlsMwepYqULQ7e+u1sBHuvidfx8sln21w=;
        b=E4LG94XuwCv7baeSyslniUB/7fW7SZbECqHbWoD2UDiPXRgODLn54FymdoYPTrai4Zmjzh
        oxgf5tkCHLHZBcue8VPxNBGqqKbcp/ptZ2i2TnQI1FhgN/96x9+Z9MjKPHydwru57Ud9o2
        +gwD7C+WXn5Gn65kGEVJAP4nwgfUgCo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624978343;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R6X/pQ7cKEtlsMwepYqULQ7e+u1sBHuvidfx8sln21w=;
        b=wPfu5FGWWN5hKwbY9JYRvwjK9UOU6iJrgw+11x1r2pMahHxulqJnuE1HRg4oT4K9FXAp+h
        mwRyGk5QikLQjWAQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id /INbCacz22APFAAALh3uQQ
        (envelope-from <ykaukab@suse.de>); Tue, 29 Jun 2021 14:52:23 +0000
Date:   Tue, 29 Jun 2021 16:52:21 +0200
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, biwen.li@nxp.com,
        Bruno Thomsen <bth@kamstrup.com>
Subject: Re: [PATCH v5] rtc: pcf2127: handle timestamp interrupts
Message-ID: <20210629145221.GF81946@suse.de>
References: <20210624152241.4476-1-ykaukab@suse.de>
 <CAH+2xPBSozyY8np=KSZrDn6nwf0__J1yRtkY_O0-SsBMLxb74g@mail.gmail.com>
 <CAH+2xPA+0pej3WrUmyDnCyrWy1TjN3fHrk+L4GW+JAwyEbF5XA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAH+2xPA+0pej3WrUmyDnCyrWy1TjN3fHrk+L4GW+JAwyEbF5XA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jun 28, 2021 at 11:42:03AM +0200, Bruno Thomsen wrote:
> Hi again,
> 
> Forgot another important comment. After you moved code to
> pcf2127_rtc_ts_read() it seems to lookup pcf2127 struct wrong.
> 
> struct pcf2127 *pcf2127 = dev_get_drvdata(dev->parent);
Good catch! I will fix it by calling pcf2127_rtc_ts_read(dev->parent).
dev_get_drvdata(dev) is correct from the irq path.
> 
> /Bruno
> 
BR,
Yousaf
