Return-Path: <linux-rtc+bounces-73-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9A57BEB83
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 22:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3058F281C61
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 20:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CAC3FB20;
	Mon,  9 Oct 2023 20:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="ZXApSf+x"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3223FB10
	for <linux-rtc@vger.kernel.org>; Mon,  9 Oct 2023 20:20:29 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFDAD6
	for <linux-rtc@vger.kernel.org>; Mon,  9 Oct 2023 13:20:26 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c28e35752cso62462061fa.0
        for <linux-rtc@vger.kernel.org>; Mon, 09 Oct 2023 13:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696882824; x=1697487624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+Vz1bOKclq9QVOuzcbH1aPgn89tmrsRZHycaiZatEw=;
        b=ZXApSf+xs3DWZi9glvHF1ftND6nJHcuKyZNMhSXqRfpzyjpe56h3jtGPbf0ReTYeIR
         RoqIRMnNlo5c4iYjSTI3QLMoSrSL3Rs4N1wpJYkT7wNvk55NM8Kj09YWfoihk3uwDV0N
         j3DLQGPgNtVUZ1Xe3iQddIydsZZGVwfsNomkvREBIGMDV5eJ9Swc92sSWIp/4FFJLqSW
         cxpBEqBDyMXZseJ7uDuknWrKTq/l6vorjNDBaNeMsX/00U5lU9RwVZ4B+UfgR9Phi2Nn
         Kmrm7CQdyUv/4Oz1E2zyTUl+ziSyCKtPfjZ+tJ8buhGvk4n7GbHom+dqb86i8kTuCv48
         ctcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696882824; x=1697487624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+Vz1bOKclq9QVOuzcbH1aPgn89tmrsRZHycaiZatEw=;
        b=dwpjRDr4lf73n/74G1wSmhUPOQjagfd+DTAqjXYqracz3flkxKeA3pQgiBGkRFUCry
         4Xej5JcaxQ00pQ9BwRfc766gVQueiSb8eA+tOO0lyUO4UAize4EfGt94IhXmzb7dCRMJ
         oyKOj5RHLvLvXQd0v3Sa8L0bu+402iBDDKfAPFyTL1mm4H/da+dJA+GT9sOs2xwmrllh
         L5GfUexuAtDhlh/sMrSC3L8K5wfIvm+1ia68ZvFG53KIACjnrD8RR+7ouUeYUy8UaVhJ
         O7CCgTdYxLsHv40cWpebGtA/zQ0y4Pe5uSQjFxmUDAN1K7JKhmB0wcFOygw5pgiAUk/d
         cjog==
X-Gm-Message-State: AOJu0YzmhWhIli9P/Jh84oUL+Plcx0HQn2DLgscVeaZmi/ulMj/Mbwq/
	59szjoXoQvbmB3pE9NGFYkGwWIKX4ieIr+6AK6mveg==
X-Google-Smtp-Source: AGHT+IEX6TNoPqier59OSFRvkXjcha7x9rPtvBMuDMX6o39QQshLcsk0zSX1nZ378MTMsNUvnOr8e/pohr3AIc4q14M=
X-Received: by 2002:a05:651c:120e:b0:2bf:fbe7:67dd with SMTP id
 i14-20020a05651c120e00b002bffbe767ddmr14845991lja.28.1696882824611; Mon, 09
 Oct 2023 13:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009165741.746184-1-max.kellermann@ionos.com>
 <20231009165741.746184-6-max.kellermann@ionos.com> <2023100921-that-jasmine-2240@gregkh>
In-Reply-To: <2023100921-that-jasmine-2240@gregkh>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 9 Oct 2023 22:20:13 +0200
Message-ID: <CAKPOu+9=WBabTBExH1GQxhXrNH9xWciceavi6QF1nbfn9cXcig@mail.gmail.com>
Subject: Re: [PATCH 6/7] fs/sysfs/group: make attribute_group pointers const
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jens Axboe <axboe@kernel.dk>, "Rafael J. Wysocki" <rafael@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Richter <rric@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Bart Van Assche <bvanassche@acm.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dan Williams <dan.j.williams@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Pavel Machek <pavel@ucw.cz>, 
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Sebastian Reichel <sre@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev, nvdimm@lists.linux.dev, 
	linux-nvme@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-serial@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 7:26=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> "*const*groups"?   That's a parsing nightmare, really hard for humans to
> read and understand.  Doesn't checkpatch complain about this?

No, checkpatch does not implement a check/warning for this style (see
my other email). There's no rule for this in coding-style.rst. Should
there be one?

