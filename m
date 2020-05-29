Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43161E7A96
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2020 12:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgE2K3L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 May 2020 06:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2K3K (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 May 2020 06:29:10 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5907C03E969
        for <linux-rtc@vger.kernel.org>; Fri, 29 May 2020 03:29:09 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id l15so1946912lje.9
        for <linux-rtc@vger.kernel.org>; Fri, 29 May 2020 03:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=APdSDB24FKrnTG8nbP/D4Pj7Jm7oL+5yM5c0ZIcV6s0=;
        b=WLUthDFRF9hwO2H7G1NrwFKj+SlMLvr6bKBEAns7Y7fPoFdUweSs75AgqWhBVR0em4
         qVsYMgxGbfwMeII4nn7D1KZ/QOxltKG8fB8JBEppTRw/FWNYUnG2WUToOqVVUxJtmKU5
         YwtgeCEXexZXdqvrW8ML4lYNUzSJ7aDokbuimnqOpmwvj/2zzTspjkx4U3dybkVdD7CT
         d7b4f4JWs1yEdNfwqFl3Q4qsN0lJlkYQ6jUmj214HXWvHKNrVvH9TB+PGmVqDFfvLcG9
         da0fZd17WLstL2M7CCCU7V1Qcc0sB6PQmJqpnzNyF2OWvxQkfjCsaVgyHzSvbwpPIkKa
         Q0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=APdSDB24FKrnTG8nbP/D4Pj7Jm7oL+5yM5c0ZIcV6s0=;
        b=owtDU4GI+EPY6x6PI97NnAAllYqdbXLdsH0yyVfJkq6LG4eu+ITMnHYSIkxg9Z1BET
         lPIPHRmQclm+BQkdrbbhhnFAMGCJRoyYo3sPNEWgRE6SEltw0/sgtEOW4VmKg1fSxVm3
         23SlXVyvaBvD03bcDl42qr7N0eAmtOFKvaG0ngV4+eBnRz8fH9HNZIeFSTBo77GLJ+gb
         HGl9YsueIwonk9Krqu7gvy1YzOGefvx+bkAu2jBmGqq9e8IYu5V7bgG0zemX682e99nX
         pR0iuPCCOA/wM3MGNBCizxqU+s+DmBd9ciwEpgbjl6J6x2vKt2H2eDk94rJIK/7JMmrn
         Ahhw==
X-Gm-Message-State: AOAM530R4BC/OBUIa6JQAULQgdhT92LjiEiF4Syf2oagYMR/p3nNEK4d
        QwSwhpjdOUSfUQy+7buPxFDZngVhjRdgXLo3aoLoq31vaic=
X-Google-Smtp-Source: ABdhPJzSfSo5TfqzrcELUWPDAOzbfVO3BgtNwH8ffnQNqnTY8XklW4t2DferDD/OEKtEns1k43eIEBcyZ2788gmuyVE=
X-Received: by 2002:a2e:7811:: with SMTP id t17mr3992979ljc.379.1590748148136;
 Fri, 29 May 2020 03:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200529001203.235304-1-kevin+linux@km6g.us> <20200529085452.GZ3972@piout.net>
In-Reply-To: <20200529085452.GZ3972@piout.net>
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
Date:   Fri, 29 May 2020 06:28:56 -0400
Message-ID: <CAE+UdophyZJtQsj2UahE481u1Yrj_qy1j9Fjx1V_feNy0RW5GQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: abx80x: Provide feedback for invalid dt properties
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "Kevin P. Fleming" <kevin+linux@km6g.us>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, May 29, 2020 at 4:54 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> > -static int abx80x_dt_trickle_cfg(struct device_node *np)
> > +static int abx80x_dt_trickle_cfg(struct i2c_client *client,
> > +                              struct device_node *np)
>
> I would remove np from the parameters and use
> struct device_node *np = client->dev.of_node;
> in the function.

Will do.

> > +             dev_err(&client->dev, "Invalid tc-diode value: %s\n", diode);
>
> Can you make that dev_dbg? This is only ever needed at board bring up/
> development time, so it is not necessary to bloat the kernel with more
> strings.

I'm using this driver via the Raspberry Pi device tree 'overlay'
mechanism, so I'm setting these parameters in a configuration file and
they are applied by the board's firmware before the kernel is booted.
As a result this is essentially 'runtime' configuration, it's not a
static device tree for the board, so end users like me could run into
this problem.

I'd be fine with changing it to dev_info though, and indicating that
the trickle charger won't be enabled in addition.
