Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D0736A783
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Apr 2021 15:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhDYNbc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Apr 2021 09:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhDYNbb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 25 Apr 2021 09:31:31 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E826BC061574
        for <linux-rtc@vger.kernel.org>; Sun, 25 Apr 2021 06:30:50 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id d19so18366623qkk.12
        for <linux-rtc@vger.kernel.org>; Sun, 25 Apr 2021 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=/FyJkmE+TP5guGdySzJDcorjg+9w5Zr0XONBXXrQx4Q=;
        b=hU2cqNONEFPDsBXyVyGJXJ5T8ecUCuVaXAmJc0O5kwumBZKZkRlj+Ja3a3l9c3+Phs
         cDt8YQ4WlNEsVYJVdeDc3hXmVqeaYP9bUtYFBbQFQwDRPMusrDtxWR140efu1WxP2LIq
         UNhvbSlvEo4ml5aOC1Vp4+nix+X3sl/eyQ1NZpA0Ut06eOI3doC5W+sCFTZ+U1Nsw4xS
         DvRWwd13RwX3nyltpuG69azYoMyiPsaLBk310pW+OXchdh0iUveu9TOj5IhtUe/ifx9f
         vTle9BEvJNbDoKqm5LKNV6+n9qOcJZaqrBqzO4VILdlp5sBFRIFBrXFgxDFPRpUT7+0K
         GWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=/FyJkmE+TP5guGdySzJDcorjg+9w5Zr0XONBXXrQx4Q=;
        b=KYpbNQYUrAnkCQ5nWm72zW6j+xHNCCl/hVcIXQ+8GsMyX61aIsBlh9EceSeECa+p8+
         t5dcxza/5Q0BqIKQIQnSrGFybs2Uj8ANCRZIiIoODRyX8bhUiY0FKiQ3RoXtyFk+uN+u
         eLmEHoVhbwGaC3GOFlqGPT1YNr1fHn2grPHxqUNFSE6ZOhbPmix1hXvaj7LirMTIwEbf
         SatvYwdgVTf52GvUX6eIBIhXY9JkRJRuFoII34IqYM0hEKaFnXWq0oICFVLNillWzDDX
         KCsebFDGLFpoWu9IiTFnzsR3tpcO2HWFbErWIxEsWFjYdydgsSbhxQr/rn8oQoz4bbTJ
         IRoQ==
X-Gm-Message-State: AOAM531kXjdK6e9OMBHxB2koEUphnHKOI7R/EjzsDidiAvN9BwR7W1v/
        yHnAFC37pcgs/Jf82AocDsbNQ7aPYVkrSBEqMWs=
X-Google-Smtp-Source: ABdhPJzk6/HHsyx99y0XQvYqtf/gwcJEwxSepKD4/fSYwwMLMmzJfP423g2Fb9l+ob4JwOZr+L64aleLc6gCR9UWM5w=
X-Received: by 2002:a37:be87:: with SMTP id o129mr13411991qkf.284.1619357450225;
 Sun, 25 Apr 2021 06:30:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:622a:1482:0:0:0:0 with HTTP; Sun, 25 Apr 2021 06:30:49
 -0700 (PDT)
Reply-To: stephenbordeaux@yahoo.com
From:   Stephen Bordeaux <swekijuhgfddsre@gmail.com>
Date:   Sun, 25 Apr 2021 13:30:49 +0000
Message-ID: <CAJ+Q7TD-U1VN9RjuHoR-0w3HGEg90TBLMbLqUJX3mQGtPKNQ0g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

  Guten Morgen, ich bin Rechtsanwalt Stephen Bordeaux, Anwalt in der
Anwaltskanzlei Bordeaux. Ich habe Sie bez=C3=BCglich des kontaktiert
Eigentum des verstorbenen Dr. Edwin sollen 8,5 Millionen Dollar sein
R=C3=BCckkehrer auf Ihr Konto. Auch in dieser Transaktion m=C3=B6chte ich d=
ass
Sie vertraulich antworten. Stephen Bordeaux
