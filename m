Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9FBB605EF8
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Oct 2022 13:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbiJTLfm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Oct 2022 07:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbiJTLfk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Oct 2022 07:35:40 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB69F19B67A
        for <linux-rtc@vger.kernel.org>; Thu, 20 Oct 2022 04:35:38 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id e22so8764808uar.5
        for <linux-rtc@vger.kernel.org>; Thu, 20 Oct 2022 04:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ly127jW85C14AP5UghCvvf5OO76ENIilasekEar+vO4=;
        b=DU09RxSXNQVHtTAXyhRGgadlfk0ObTmdJolTrmqVLAxq9X05exuGsTyEGDWczVMEoQ
         ZuOZeh1Oy20WxuLw+c1d1xUPqUCFk9O0gNq+3JMPlFkrH8vSK7Vo8bENWXhXxPJ6LZgn
         rfHT6+WBTE3NhMNurUhDVDgXAqSZb74rjHQhQXXyn32mEoEZNb6CQYcOJWZGdpHq8bWQ
         /pYhx5X/s6wfY2HT60uYY7VoKkKiprZtite1uQLBE7X4yd2bFw+oaV+KVrFbNNVSZOz3
         hG9uc7cpkvovd2ZjZLPt1uNF51QK9fGDq2kqkcyoh6hRJYROLPwg65Gk3E4XSDDmeXpe
         42MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ly127jW85C14AP5UghCvvf5OO76ENIilasekEar+vO4=;
        b=MKzHMsMQ5naFddQQDVJmtk6YGVIx/+sJ5/Yo2LIZFivRFSfMPxSxGtXsqRXtVM9oaM
         F/lxsLZGsz3RNY72YjkuKcOnYln947ueP1PAkDILwad7S2sTQOgPQXLExQtQ4/Kra+G1
         zGXyzSx0XPigVKJfJTckR/HXrqr5E1Grus/085KiCKBqZIPdnl6rSxnAXQ9u/ypUMp+0
         2+rQYB/9+6Ko0i27TEhmY5OdL/FH8oauEI3cUKfT0HswJP2O+/gHtaFUx7RgNkA7aW3T
         T88XqNqnIqLU9RyTF0ukxKT5y1UUexb1c29EOlRwLwk9beVZWyM+1zYuh/EjVRo17m38
         wvqQ==
X-Gm-Message-State: ACrzQf0DzuWQoU8uiXEmClYpLbfRVSCxv8owKwsVuHMnDRtTWos96LDd
        nWK1LK1TXRMqSnbkhysXx+5U5YDiiQhP7PrGz1R1Ox+vDhB0mA==
X-Google-Smtp-Source: AMsMyM4AL7NGWgg1aMEHowoLwsAgo/4oJa60m9nHUHoO6u1BV0uMLY5zWXF/4aiGJhxl+fje2bYpGgPe2hQvOaUZiaE=
X-Received: by 2002:a67:ac0c:0:b0:3a9:e899:3b9b with SMTP id
 v12-20020a67ac0c000000b003a9e8993b9bmr808028vse.9.1666265737374; Thu, 20 Oct
 2022 04:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221019152947.3857217-1-arnd@kernel.org> <20221019152947.3857217-9-arnd@kernel.org>
In-Reply-To: <20221019152947.3857217-9-arnd@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Oct 2022 13:35:26 +0200
Message-ID: <CAMRc=MeS4s280OQp-RdWuRV6O1h11_UumGKQfiF8PECB3043OQ@mail.gmail.com>
Subject: Re: [PATCH 08/14] rtc: remove davinci rtc driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Sekhar Nori <nsekhar@ti.com>, linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Oct 19, 2022 at 5:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The Davinci dm365 SoC support was removed, so the rtc driver
> has no remaining users.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
