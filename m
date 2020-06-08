Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8601F282C
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Jun 2020 01:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730922AbgFHXtm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Jun 2020 19:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731815AbgFHXtk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Jun 2020 19:49:40 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2E8C08C5C2;
        Mon,  8 Jun 2020 16:49:36 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id y13so20314819eju.2;
        Mon, 08 Jun 2020 16:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uBzs8KmsEdBvGAcXk3Vb8AURrpvHv861x7OOzwsbqVc=;
        b=MWtK/hHZaJhvWGA/KGnL6we8nFDF9ORpa5xmtB0dqPXfcrF7VmYOyyCxwnI02wRjgQ
         Y6jC3kPvPiO4UWPRrhjC2a68YdRNU4jWHLBk1zfKLL1K+VGcoMnwOCAWLLKyeW+498AP
         49aX5edGyWoqieus3bGndrhnFWvX1uZDQOxrJNNN6P4cYKJqYWHWSvYqt/Zw8Qniy3Jc
         9CLiWZpdSxBv39fdRS4S4VcLWnWqGpcWKRnOKBhvgvcZMIADzy4B7JwlrWKIPfMiS8Xa
         8F/kq4ci9tLnHW86+bqL1zUPQO4IQvRfCKAdDLy0F2fsugrRxTJp5WvQ3fjEX9TkZCLV
         LIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uBzs8KmsEdBvGAcXk3Vb8AURrpvHv861x7OOzwsbqVc=;
        b=b3kKZrQfCeSVPgLd1iT+L3LfMM6O6JRv6+iK+Z2Se6viFu4/UdvEN41uEOyKAPLMcf
         3Cl2tjjd0eLsaiFDoLjHufOGdYXvF4Kv4OFQF3ztvB8hX3IptDwEubzTxyQEC5VBdBv0
         zMzb2FOr7PXwtKpq6aP/fw/bW40//BX3fRV3Vcyze5ag/M/4qFySkPFDY9XwfUMNXxi2
         DnemHzPa+8z6r6jsOKzcrHFe8Ckyul5GZRT9aIjIfuswKDw0eCsHi7+QBq9WFDruVOBk
         /1w/voecdwtslZ8yq5FpNgv5pIIPafPYHSoEn8EE2V4NfosFZJgmv7La9BkKg/HZmBTz
         pdfA==
X-Gm-Message-State: AOAM532I3tE4JYO2zgFKYuGfyljpqfKuyDDZA59qPl20P/jjlwBsEOpr
        BgtR6BXW14oDbJ8VnNoz4ZOUopXpayxTuiM/6ug=
X-Google-Smtp-Source: ABdhPJz/x7AFZlVQBJzN5QMIPCadQrzApEhoeEDla+NqJE/YhJwNxPC+WSVQZkpGuTDHFF60S5m6BLI7I9L5hyfYi74=
X-Received: by 2002:a17:906:6403:: with SMTP id d3mr22550773ejm.386.1591660174835;
 Mon, 08 Jun 2020 16:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
 <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
 <20200523151027.GA10128@mail.rc.ru> <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005251151550.4135@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005261046340.29117@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.DEB.2.20.2005270114380.1027@tpp.orcam.me.uk> <alpine.LRH.2.02.2006080256360.15393@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2006080256360.15393@file01.intranet.prod.int.rdu2.redhat.com>
From:   Matt Turner <mattst88@gmail.com>
Date:   Mon, 8 Jun 2020 16:49:23 -0700
Message-ID: <CAEdQ38HcqZWrVEHoPcngd_PnNQsf+OxFob1upAwx6TL-=_Uopg@mail.gmail.com>
Subject: Re: [PATCH v7] alpha: fix memory barriers so that they conform to the specification
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     "Maciej W. Rozycki" <macro@wdc.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Jun 7, 2020 at 11:58 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> Will you submit the patch to Linus' tree in this merge window?
>
> Mikulas

I will do it. Thank you, Mikulas!
