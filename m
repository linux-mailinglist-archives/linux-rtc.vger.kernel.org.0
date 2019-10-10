Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3DBBD1D74
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2019 02:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731542AbfJJAfu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Oct 2019 20:35:50 -0400
Received: from mx6.ucr.edu ([138.23.62.71]:24530 "EHLO mx6.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731230AbfJJAft (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 9 Oct 2019 20:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1570667749; x=1602203749;
  h=mime-version:from:date:message-id:subject:to;
  bh=nWu3ebWjqXjCvzB4v842JIolrNY8p92IVVNrwebapD4=;
  b=ONissujfcMeMqvgW9vzgAndrQgUr7u2J+0Mt2QKqN+NA8btYr4nzzJzW
   e8BldebK/8kzlOkSFiWV2AEjLhWZhv/sOycfsNFMFqOLn+Th6WMRddL6/
   AD51fx7f8yvt5BCcZ8xaPjfeKS88VEzy6fOeHtXMr9j7lsKWHBvqlPABG
   kOLJ65T2sIoSwXqh1qDElManjqllYQYlA0yJLClEaCjsBrV8YidUVFEEo
   L7w8foXL9lU2jSaho+u6KVfSVa53c9X7xBi4erB3XK5wrek2/uT1etsqF
   YSr3TsnztklhbEuxGQQRyyQqAeiuFXuiNRMBQOqOqAhfqumlL0iz9ANzQ
   w==;
IronPort-SDR: yxEo9rgZK33RYns9+M8FfHa6Ym1OtgkOtwVRYTq/WFsx+yFE5B1IK3UQ7sMAonRi5os24ZQDM6
 IxOho3cu50CKEHzPemYrr6Fu+WJbUJ9kT10TlpR63anMnCzQgnU3cBD0S66ppEQrCPVgdHw8cc
 N1CPDr4LqjWUOHS92e1lWzkUUL7HVlFVQBCDmLH63JS2FNRiu5WCimJpDKM5vGvAoUrzTh3Vb5
 br74neq4mQLxcHcTB5ZkV4c+j0BlPTlYxMzhrpw0f8NfpLr26THh47JMXrbIrxd8z0BPffbtZQ
 DEw=
IronPort-PHdr: =?us-ascii?q?9a23=3A/drsYBOeSF5kRi+S8dAl6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0I/j4rarrMEGX3/hxlliBBdydt6sfzbSM+Pu/EUU7or+5+EgYd5JNUx?=
 =?us-ascii?q?JXwe43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQ?=
 =?us-ascii?q?viPgRpOOv1BpTSj8Oq3Oyu5pHfeQpFiCezbL9oLRi6swrdu8cUjIB/Nqs/1x?=
 =?us-ascii?q?zFr2dSde9L321oP1WTnxj95se04pFu9jlbtuwi+cBdT6j0Zrw0QrNEAjsoNW?=
 =?us-ascii?q?A1/9DrugLYTQST/HscU34ZnQRODgPY8Rz1RJbxsi/9tupgxCmXOND9QL4oVT?=
 =?us-ascii?q?i+6apgVQTlgzkbOTEn7G7Xi9RwjKNFrxKnuxx/2JPfbIWMOPZjYq/RYdYWSG?=
 =?us-ascii?q?xcVchTSiNBGJuxYIQPAeQPPuhWspfzqEcVoBuiGQWhHv/jxiNUinL026Axzu?=
 =?us-ascii?q?QvERvB3AwlB98BsnXUrdT1NKcPVuC+0arHzTXZYPNXxDzw74jJcxEhof6WXL?=
 =?us-ascii?q?J8bdbdxEc0GgPYklqQs5bpMC2I2eQQqmWW6fdrW+G3i2M/tQ19vjyiyt0vh4?=
 =?us-ascii?q?TJnI4Z11HJ+CdjzIs3ONG1TlNwb8S+H5tKrS6aMpN7QsYlQ251pik30qYGuZ?=
 =?us-ascii?q?unfCgSz5Qn2gLfZ+SHc4eW5hLjU/6cITJii3JkfLKznhKy8Ua9xuHlWMm50k?=
 =?us-ascii?q?tGojBKktnLsXAN2BjT5dadRvRh+Ueh3C6D1wHV6u5aPUA5jbTXJ4Ilz7IqlZ?=
 =?us-ascii?q?cesV7PEjL3lUj0lqObdFgo9vCt6+v9Y7XmopGcN5VzigH7Kqkvms2+AeQiPQ?=
 =?us-ascii?q?gPQ2SX5eqx2ab+/ULlWrVGlOM5nbTEsJzCP8QUura5AxNJ0oYk8xu/Czam0N?=
 =?us-ascii?q?IFnXgINV5FYg6HgJTyNlHQL/D3E+2/j06vkDh13fDGOKPuApHXInjEirfhcu?=
 =?us-ascii?q?U110kJ4Q4+1stW4Z5ODfkzPff2XQelvZrKExo8NCSoxPnqEslw3YNYWH7ZRu?=
 =?us-ascii?q?ewNK7CuFmE/O9nCeSIYIgTuX6pIvwo9/fogWU031UQea2u25o/Yne/AvBnJQ?=
 =?us-ascii?q?OSZn+6xp8FEGEXrk8kUOfCllKPS3hQamy0UqZ64Ss0TMqiDIHeVsWujaaH0S?=
 =?us-ascii?q?OTAJJbfCZFB0qKHHOucJ+LH78+aCODP8kpqz0NU/D1WY8gxAyorSfx0Px6Jf?=
 =?us-ascii?q?CS9yEF49ar/9h44eLCiFkJ8jp7R5CWyGaLQEl/hSUVTCVw0axi9x9T0FCGhJ?=
 =?us-ascii?q?l5kfxFEpRh5/pIGlMrJ57VzrQiUPjvURiHc9uUHgX1Cu66CC08G4pii+QFZF?=
 =?us-ascii?q?xwTpD71kjO?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GYAgCLfJ5dh0enVdFmDoIzhBGETY5?=
 =?us-ascii?q?cgW0FgyUBjWmIOYF7AQgBAQEOLwEBhxIjNQgOAgMJAQEFAQEBAQEFBAEBAhA?=
 =?us-ascii?q?BAQEIDQkIKYVAgjopAYNVEXwDDAImAiQSAQUBIgEaGoMAgngFpGWBAzyLJoE?=
 =?us-ascii?q?yiGUBCQ2BSBJ6KIwOgheDbnOHUoJeBIE5AQEBlS+WVwEGAoIQFAOMUYhFG4I?=
 =?us-ascii?q?qAZcVji2ZTw8jgTECgg4zGiV/BmeBT08QFIFpjXFbJJFLAQE?=
X-IPAS-Result: =?us-ascii?q?A2GYAgCLfJ5dh0enVdFmDoIzhBGETY5cgW0FgyUBjWmIO?=
 =?us-ascii?q?YF7AQgBAQEOLwEBhxIjNQgOAgMJAQEFAQEBAQEFBAEBAhABAQEIDQkIKYVAg?=
 =?us-ascii?q?jopAYNVEXwDDAImAiQSAQUBIgEaGoMAgngFpGWBAzyLJoEyiGUBCQ2BSBJ6K?=
 =?us-ascii?q?IwOgheDbnOHUoJeBIE5AQEBlS+WVwEGAoIQFAOMUYhFG4IqAZcVji2ZTw8jg?=
 =?us-ascii?q?TECgg4zGiV/BmeBT08QFIFpjXFbJJFLAQE?=
X-IronPort-AV: E=Sophos;i="5.67,278,1566889200"; 
   d="scan'208";a="81350252"
Received: from mail-lf1-f71.google.com ([209.85.167.71])
  by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2019 17:35:48 -0700
Received: by mail-lf1-f71.google.com with SMTP id r3so979541lfn.13
        for <linux-rtc@vger.kernel.org>; Wed, 09 Oct 2019 17:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=G4W3e3qGvtDBybhSHNkiyzwqamwrUZ6xOAFBHkAsOEk=;
        b=bkAvZ7h+3WXtly4kgst+unEbMrFvwgXNa8rEPFG33+IU68AbqZ0jcmDW+TXuOt+vOH
         3jzadEE6f9EBtQZBdk9MF0m9frkQd6v+Kbmp4wTSGhYewPW/2mLPXXLeTFDVo0QjJHj2
         qty2cWdGRx0WITopDE8blq6eaDV+REqCiQJwjcgzaof0NieXPvVBpzH+SYTPYZii8FLU
         FkYm1dLPCgB8D6y4xz3T8FyouauALRTm7fBVyMUUldKXfqNYRKbezPif7+Yt6CLZsPhG
         Sseey4yxGaH6z8kh2EnZrH956vCDglmwnPk/wU3RyxQUPdiZQXInY6N6n5Qnk1FoGeXg
         Eztw==
X-Gm-Message-State: APjAAAV5QTUxeYdeLpzewyodsOLjkQW4FWL6vIxUjdzrsygkrosRFK7N
        d8iKGpHTdGqYlgL6Pf8aayIJzjIOR0PjuE1wOtzEwzxzTG+jliBoRjWimQ0rWkRjptt6Nvkf5st
        VXOTwwYLlyTFkaXJt9qoGdrirXKF3Yt8QlYnjBw==
X-Received: by 2002:a2e:9a4e:: with SMTP id k14mr4006719ljj.104.1570667746628;
        Wed, 09 Oct 2019 17:35:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzvF9cWwtovR/T13+tT+9QEtwd/pWMQ6spGIHADyJ6SkZx60DwAP8BAZs9zWtZz8M8Q2/bsxHfBns3rLL9Dquk=
X-Received: by 2002:a2e:9a4e:: with SMTP id k14mr4006714ljj.104.1570667746390;
 Wed, 09 Oct 2019 17:35:46 -0700 (PDT)
MIME-Version: 1.0
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Wed, 9 Oct 2019 17:36:28 -0700
Message-ID: <CABvMjLRirOKZvCaknF6isxRPvOgMeij2YZe1ef83EEg0kFnUjg@mail.gmail.com>
Subject: Potential uninitialized variables in rtc: ds1343
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhiyun Qian <zhiyunq@cs.ucr.edu>,
        Chengyu Song <csong@cs.ucr.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi All:
drivers/rtc/rtc-ds1343.c:
Inside function ds1343_show_glitchfilter(), variable "data" could be
uninitialized if regmap_read() returns -EINVAL. However,"data"
is used later in the if statement, which is potentially unsafe. Patch
for this case is hard since the return value -EINVAL is unacceptable
for ds1343_show_glitchfilter().

-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
