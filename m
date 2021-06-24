Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15293B3272
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jun 2021 17:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbhFXPYs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Jun 2021 11:24:48 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:48390 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbhFXPYr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Jun 2021 11:24:47 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8BD121FD93;
        Thu, 24 Jun 2021 15:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624548146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7azKEXfil4hewAVbW/8dZ/bbNMojDcnW4Kr4H0GT/24=;
        b=xL2DO4b7fA6CQ46ZjU/V90x/E07SUkEpHskpiBIsTKSJWlOGgJrTPd8C/9/B1eJlC27bUi
        bdq+YADgVhx/LcYWhqp6ywzaPD7YHBa1/6fKBhXcMBPXRrLW5Fo6UaL6I+Mv+gzAr8E7Fn
        zlYXDblHZg3NMKLTzwsScp/KEcwy7d8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624548146;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7azKEXfil4hewAVbW/8dZ/bbNMojDcnW4Kr4H0GT/24=;
        b=4XRpviWKzO40mgupOFvlyE7vgM3RmLwLzMvHkycwetsaJp4nsJc6CY54Scv9vjUk3MVS4W
        POwAWaYqva1aEPCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 5718711A97;
        Thu, 24 Jun 2021 15:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624548146; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7azKEXfil4hewAVbW/8dZ/bbNMojDcnW4Kr4H0GT/24=;
        b=xL2DO4b7fA6CQ46ZjU/V90x/E07SUkEpHskpiBIsTKSJWlOGgJrTPd8C/9/B1eJlC27bUi
        bdq+YADgVhx/LcYWhqp6ywzaPD7YHBa1/6fKBhXcMBPXRrLW5Fo6UaL6I+Mv+gzAr8E7Fn
        zlYXDblHZg3NMKLTzwsScp/KEcwy7d8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624548146;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7azKEXfil4hewAVbW/8dZ/bbNMojDcnW4Kr4H0GT/24=;
        b=4XRpviWKzO40mgupOFvlyE7vgM3RmLwLzMvHkycwetsaJp4nsJc6CY54Scv9vjUk3MVS4W
        POwAWaYqva1aEPCQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id AjuZEzKj1GARHwAALh3uQQ
        (envelope-from <ykaukab@suse.de>); Thu, 24 Jun 2021 15:22:26 +0000
Date:   Thu, 24 Jun 2021 17:22:24 +0200
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, biwen.li@nxp.com
Subject: Re: [PATCH RESEND v4] rtc: pcf2127: handle timestamp interrupts
Message-ID: <20210624152224.GD81946@suse.de>
References: <20210602104956.806-1-ykaukab@suse.de>
 <CAH+2xPAL0w4Urjpxopu8g-kGveTxLXAm8EVUc8s8xpX=fb7NeQ@mail.gmail.com>
 <20210624101452.GC81946@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210624101452.GC81946@suse.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jun 24, 2021 at 12:14:52PM +0200, Mian Yousaf Kaukab wrote:
> Second option is to provide support for both cases. Let me know what
> do you prefer.
I have implemented this and I will send it as v5. Please review.

BR,
Yousaf
