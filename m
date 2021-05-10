Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C213780E4
	for <lists+linux-rtc@lfdr.de>; Mon, 10 May 2021 12:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhEJKLs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 10 May 2021 06:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbhEJKLs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 10 May 2021 06:11:48 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6383C061574
        for <linux-rtc@vger.kernel.org>; Mon, 10 May 2021 03:10:42 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id x17so3792335vsc.0
        for <linux-rtc@vger.kernel.org>; Mon, 10 May 2021 03:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=FBZbU3iwyQDYQqeSRGTNKiskutU02Chvl1nOpbng8Os=;
        b=U7UgpebG3y+QTmhMnzyfvTRRZIgL6qwijx9sAaan5P/x5n2GgIWoK9UyZRhz7BzdGz
         y/qquf/ooyR7Hsv5M5ukYfnOQM2lhIsYCDy+7DU5k+0VqyAgIjvQKXqSJ9YisEY0TpAI
         BhR+O2eRRrOqm3ySUxNRASBzPmv4VU8tLVEPRlTzMzPmKBPNXtF6JA2oDeAa/ehJzvNz
         pmHwlOHuKC8sX7nT1MbRDD592gQPLvOzj9i/vkQvNqitBiHwcSGBWxFCO6N+3RzC2qtn
         wXUcMJ8gZm7zT9mADdnihQ+rAKgq6T7e+xdeEdTreetJK7fxOsZFFnhe6TSGHbHLYtk+
         6Yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=FBZbU3iwyQDYQqeSRGTNKiskutU02Chvl1nOpbng8Os=;
        b=Ay9Ic4wEMYT7APfA5cVO6rsgICvut51fSM5NsXjVtsfvvi6dw1KyMFKwyWYmmJJ/hm
         WDLNeZB677iO47S5G4G1IBAO1zdhA6PKqe2PZwUPrImaSxksvOfE3lmqtBdXVNSuSaJS
         T4tuDVuujAPTs/nX/aBVwTxnK5oSklq2ZVC6vk5pphGz5Jpo/Mm87G1hbcWcXAHGedtJ
         EZ4bcq0MNXby359bW2aXepIVINDGIlvWMi+z2HeJaRd7Fs/cXpPrkb5SUrb/uqUaQGp2
         RlyMxjnq5IIZpmGGPq/yZniHWEp1ACT30oIhR+1Oe/WlfFp+l7qe1d3tehU5V9wAJik+
         ZgXg==
X-Gm-Message-State: AOAM530or2EEAQhxahdfvG18awv1qL9Ab92mdKctGKpOZ+bmCkcsCX00
        ueGhyxeSprLObL4Wtnf9DyUlCBQivViJGMZ1jQw=
X-Google-Smtp-Source: ABdhPJz7h/K7MRBMuWbzcgmE60z/uBiuoWSGBRW4duiHIxitdU3H3hPydLYkaFOx1VWGbHj6Uj96pp6SHLUXrCEXoQg=
X-Received: by 2002:a67:cb0c:: with SMTP id b12mr18110365vsl.16.1620641441517;
 Mon, 10 May 2021 03:10:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:7714:0:0:0:0:0 with HTTP; Mon, 10 May 2021 03:10:39
 -0700 (PDT)
Reply-To: uchennailobitenone@gmail.com
From:   uchenna <robertandersonhappy9@gmail.com>
Date:   Mon, 10 May 2021 03:10:39 -0700
Message-ID: <CAJ63Umjm8fwY5SFOsLLyz-hP7hFq7PNiX7rnaJ3roug_etU-0Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

0JTQvtGA0L7Qs9C+0Lkg0LTRgNGD0LMsDQrQnNC10L3RjyDQt9C+0LLRg9GCINCR0LDRgC4g0KPR
h9C10L3QvdCwINC40LvQvtCx0LguINCvINCw0LTQstC+0LrQsNGCINC4INGH0LDRgdGC0L3QvtC1
INC70LjRhtC+Lg0K0LzQtdC90LXQtNC20LXRgCDQv9C+INGA0LDQsdC+0YLQtSDRgSDQvNC+0LjQ
vCDQv9C+0LrQvtC50L3Ri9C8INC60LvQuNC10L3RgtC+0LwuINCSIDIwMTYg0LPQvtC00YMg0LzQ
vtC5INC60LvQuNC10L3RgiDQv9C+INC40LzQtdC90LgNCijQnNC40YHRgtC10YAg0JTQttC+0L0s
INGB0LrQvtC90YfQsNC70YHRjykg0K8g0YHQstGP0LfQsNC70YHRjyDRgSDQstCw0LzQuCDQv9C+
0YLQvtC80YMsINGH0YLQviDQstGLDQrQvdC+0YHQuNGC0Ywg0YLRgyDQttC1INGE0LDQvNC40LvQ
uNGOINGBINGD0LzQtdGA0YjQuNC8LCDQuCDRjyDQvNC+0LPRgyDQv9GA0LXQtNGB0YLQsNCy0LjR
gtGMINCy0LDRgSDQutCw0LoNCtC/0L7Qu9GD0YfQsNGC0LXQu9GMINC4INCx0LvQuNC20LDQudGI
0LjQtSDRgNC+0LTRgdGC0LLQtdC90L3QuNC60Lgg0YHRgNC10LTRgdGC0LIg0LzQvtC10LPQviDQ
v9C+0LrQvtC50L3QvtCz0L4g0LrQu9C40LXQvdGC0LAsDQrRgtC+0LPQtNCwINCy0Ysg0LHRg9C0
0LXRgtC1DQrRgdGC0LDRgtGMINC10LPQviDQsdC70LjQttCw0LnRiNC40Lwg0YDQvtC00YHRgtCy
0LXQvdC90LjQutC+0Lwg0Lgg0L/QvtGC0YDQtdCx0L7QstCw0YLRjCDQtNC10L3RjNCz0LguINC+
0YHRgtCw0LLQuNCyINC90LDQu9C40YfQvdGL0LUNCtC90LDRgdC70LXQtNGB0YLQstC+INGB0LXQ
vNC4INC80LjQu9C70LjQvtC90L7QsiDQv9GP0YLQuNGB0L7RgiDRgtGL0YHRj9GHINCh0L7QtdC0
0LjQvdC10L3QvdGL0YUg0KjRgtCw0YLQvtCyDQrQlNC+0LvQu9Cw0YDQvtCyICg3LDUg0LzQu9C9
INC00L7Qu9C70LDRgNC+0LIg0KHQqNCQKSDQnNC+0Lkg0L/QvtC60L7QudC90YvQuSDQutC70LjQ
tdC90YIg0Lgg0LfQsNC60LDQtNGL0YfQvdGL0Lkg0LTRgNGD0LMg0LLRi9GA0L7RgdC70Lgg0LIN
CsKr0JTQvtC8INCx0LXQtyDQvNCw0YLQtdGA0LjCuy4g0KMg0L3QtdCz0L4g0L3QtSDQsdGL0LvQ
viDQvdC4INGB0LXQvNGM0LgsINC90Lgg0LHQtdC90LXRhNC40YbQuNCw0YDQsCwg0L3QuCDRgdC7
0LXQtNGD0Y7RidC10LPQvg0K0YDQvtC00YHRgtCy0LXQvdC90LjQutC+0LIg0LIg0L3QsNGB0LvQ
tdC00YHRgtCy0L4uINCh0YDQtdC00YHRgtCy0LAsINC+0YHRgtCw0LLQu9C10L3QvdGL0LUg0LIg
0LHQsNC90LrQtS4NCtCS0Ysg0LTQvtC70LbQvdGLINGB0LLRj9C30LDRgtGM0YHRjyDRgdC+INC8
0L3QvtC5INGH0LXRgNC10Lcg0LzQvtC5INC70LjRh9C90YvQuSDQsNC00YDQtdGBINGN0LvQtdC6
0YLRgNC+0L3QvdC+0Lkg0L/QvtGH0YLRizoNCnVjaGVubmFpbG9iaXRlbm9uZUBnbWFpbC5jb20N
CtCd0LDQuNC70YPRh9GI0LjQtSDQv9C+0LbQtdC70LDQvdC40Y8sDQrQkdCw0YAuINCj0YfQtdC9
0L3QsCDQmNC70L7QsdC4DQo=
