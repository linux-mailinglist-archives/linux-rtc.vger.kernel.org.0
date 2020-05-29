Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588391E7B67
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2020 13:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgE2LNP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 May 2020 07:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgE2LNO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 May 2020 07:13:14 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A59C03E969
        for <linux-rtc@vger.kernel.org>; Fri, 29 May 2020 04:13:13 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q2so2079845ljm.10
        for <linux-rtc@vger.kernel.org>; Fri, 29 May 2020 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=eYLaZzpBN8QG1hBZUQ+FlS9qIoEqYofYVQz0LbkQCJI=;
        b=DFdBnhtO/AYXsEZ7PIV+OoYHXj8cTGeMOsl0MdH2Kj/fFh8Uz8Ll534Aaj/xl3v76D
         axUrlbJjco9GNcX9ujf9fQcyPxSAsz1VAFUqrnyZZgttnEsilAcejAbplmMJr2dxjjcS
         OLvolJNT3kkaHXPMO1WBl6yCand9NrWvm8uADDjk4Lzebka2RYvjoaMJFPxgwQRoJLDQ
         umLm/agvDmRIOnR3nRhbb46eKMzw7QkWBsXSx2rto/VlWICoh51wazlvQSMZflv7slj0
         7qBXDSE4LxfT+bubx0cvet8vKGDWWz7zpyx5m8S0CnYNp4OhAe/5xDl0mcUluoyKei9x
         cyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=eYLaZzpBN8QG1hBZUQ+FlS9qIoEqYofYVQz0LbkQCJI=;
        b=fGdrV4gYY1Ty2FlDSnZrXc975qMohJK1nzbs4/QsqkwOYbY6IsAMArO+94HYa7qG9L
         OddmQvUuojur8IVUrLSLWwiq5rapt6Y5zSDcL05eJ3vQBrHAVgvTCFGIm/ryUxrH+U2z
         tMn8Y1iVikTsEJGkZM1z8n1EJoLyD8ektMZna43CaNSo42VgPTat7WDNFscPsb0gdOzs
         f4zh8VlnPluUH63J3xx5l6cCrbjfcz29nfKcHPWARaTKYigzC4uVTeIHK/Sdbdo6P7T4
         PAy+RF61gYL+j8iez4Zbz80fJUmjrNWHhy+o0eEFRDfD/bHPqnjYbApLqjdHYGl289Dp
         mFLw==
X-Gm-Message-State: AOAM532m12ov3nxI9frGCBZvDmqBm2HOwSmfPQ2QQyla1iFJMznw4hTl
        fbqVBrgcMx/ba+kG6cLldAeibFoJOB/o4Vp8+zmQ48wfq4wD9A==
X-Google-Smtp-Source: ABdhPJywd650bOpIJtr6IgzlN9aDYUea/9MD4youtghdbFmyZ7eDX1MvTdYgNhE9eP5iB4kbIIR5oOnGI3ujplHuXYo=
X-Received: by 2002:a2e:9649:: with SMTP id z9mr3853486ljh.204.1590750791373;
 Fri, 29 May 2020 04:13:11 -0700 (PDT)
MIME-Version: 1.0
From:   "Kevin P. Fleming" <kevin+linux@km6g.us>
Date:   Fri, 29 May 2020 07:13:00 -0400
Message-ID: <CAE+UdorayxG79wDW8Up6-O_LdoBvcqQNQ4yYM90n2kv+XAu4+g@mail.gmail.com>
Subject: abx80x: RV-1805 initialization order correct?
To:     linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The driver has a block of RV-1805-specific code (under the comment
'Configure RV1805 specifics'), which is executed before the part
autodetection code (under the comment 'part autodetection').

If the driver is loaded with the 'generic' device data for abx80x, and
the actual part in use is an RV-1805, the part-specific code won't be
executed. I'm using this driver in a dynamic Device Tree environment,
and at the moment I can't specify the part as the driver is loaded
(although I could modify the overlay to support that if required).

So the question is: does the RV-1805 specific code *have* to be
executed before part autodetection in order to avoid the lockup
situation mentioned in the comments, or could it be moved immediately
after the autodetection so that it will be always be executed for an
RV-1805 part?
