Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30016D0366
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2019 00:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbfJHW05 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Oct 2019 18:26:57 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39693 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJHW05 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Oct 2019 18:26:57 -0400
Received: by mail-io1-f68.google.com with SMTP id a1so546517ioc.6
        for <linux-rtc@vger.kernel.org>; Tue, 08 Oct 2019 15:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/za/eHCc5YOxno3F960dEsfMKhLfXOAXTv/vlKJMoEE=;
        b=g385mqhhG3YqM6741Dr3UcBd275bV4bgqOgxgbtRSIeaKCso2qhjcuIJljO0DyDqCD
         vQxX+JHS+1UrGIA7/Vd4HDuE0qE8Kdo6R7AO8OX9T93Mg7GNMf+ZmQMCIedq/UhCl6yd
         jepHsXFKTIDl6ln/MSBaXdNH4PO6Zy3k06emw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/za/eHCc5YOxno3F960dEsfMKhLfXOAXTv/vlKJMoEE=;
        b=TOzJob6OfTVu5DkK3HT/lLGoVeNNv9bGSbDY5La2CecwVEsEKGjq+KRXKtId86JHRo
         Oyrh7SVpVPyuGPY0bSGO2pB9yUc2TH8DL+qgUOwDBnssdvyub1xNu/XvSWK/veyxpZtR
         qM3gC7L/OCNW+YCugadLqBfuzue/q6nPfi6DLrXN98ZLWRXp0t4DXv5USGxRvbsuatTk
         p5t7e45aXWDNJtCVEw22SfwDgm4kGZ4REvN+71kK/Kjl0LvrlVdOU19lTeiJsK49qLQN
         /WRj1MHjtuFaddHvFH8coddnay+rpTx+IjP2udORpPcLfPGmT8EFZ7npfGb0cjGUeUY6
         lT7g==
X-Gm-Message-State: APjAAAVNJssi5F4Kn1rgoLSlt/zXLguGOzquWfDz+rXXCuq+KgsitCeV
        nOv3FeiwBOI0JcHtWQVVuQbTIQ==
X-Google-Smtp-Source: APXvYqzXddRYqKMm1dR+D3Qly2LRExHYiRLSWfctGIW1OxRhYNXxrwkIVbE0LxYj80sjwev4r6tcvw==
X-Received: by 2002:a92:910e:: with SMTP id t14mr655771ild.40.1570573614919;
        Tue, 08 Oct 2019 15:26:54 -0700 (PDT)
Received: from chromium.org ([2620:15c:183:200:5d69:b29f:8fd8:6f45])
        by smtp.gmail.com with ESMTPSA id m9sm150981ion.65.2019.10.08.15.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 15:26:54 -0700 (PDT)
Date:   Tue, 8 Oct 2019 16:26:52 -0600
From:   Daniel Campello <campello@chromium.org>
To:     Nick Crews <ncrews@chromium.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, enric.balletbo@collabora.com,
        bleung@chromium.org, dlaurie@chromium.org, djkurtz@chromium.org,
        dtor@google.com
Subject: Re: [PATCH v4] rtc: wilco-ec: Handle reading invalid times
Message-ID: <20191008222652.GA111471@chromium.org>
References: <20191004142608.170159-1-ncrews@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004142608.170159-1-ncrews@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

LGTM.
Reviewed-by: Daniel Campello <campello@chromium.org>
